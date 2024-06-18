import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/calculate_distance.dart';

part 'adverts_cubit.freezed.dart';
part 'adverts_state.dart';

@injectable
class AdvertsCubit extends Cubit<AdvertsState> {
  AdvertsCubit(this._repository, this._advertsFilterCubit)
      : super(const AdvertsState.initial());

  final IAdvertRepository _repository;
  final AdvertsFilterCubit _advertsFilterCubit;
  List<Advert> _adverts = [];

  Future<void> getAdverts({String? queryText, bool useFiltering = true}) async {
    emit(const AdvertsState.loadInProgress());

    final failureOrAdverts = await _repository.getAdverts();

    failureOrAdverts.fold(
      (f) => emit(AdvertsState.loadFailure(f)),
      (adverts) async {
        if (useFiltering) {
          if (queryText != null) {
            final queryTextFormatted = queryText.trim().toLowerCase();

            _adverts = adverts.where(
              (advert) {
                return advert.name.toLowerCase().contains(queryTextFormatted) ||
                    advert.description
                        .toLowerCase()
                        .contains(queryTextFormatted) ||
                    advert.services.any(
                      (service) {
                        return service.name
                                .toLowerCase()
                                .contains(queryTextFormatted) ||
                            service.description
                                .toLowerCase()
                                .contains(queryTextFormatted);
                      },
                    ) ||
                    advert.location.address
                        .toLowerCase()
                        .contains(queryTextFormatted) ||
                    advert.location.formattedAddress
                        .toLowerCase()
                        .contains(queryTextFormatted);
              },
            ).toList();
          } else {
            _adverts = adverts;
          }

          await filterAdvertsList(_advertsFilterCubit.state);
        } else {
          emit(AdvertsState.loadSuccess(adverts));
        }
      },
    );
  }

  Future<void> filterAdvertsList(AdvertsFilterState filterState) async {
    final filteredAdverts = await _filterAdverts(_adverts, filterState);
    emit(AdvertsState.loadSuccess(filteredAdverts));
  }

  Future<List<Advert>> _filterAdverts(
    List<Advert> adverts,
    AdvertsFilterState filterState,
  ) async {
    final List<Advert> filteredAdverts = [];

    for (final Advert advert in adverts) {
      final passesCategory = _filterByCategory(advert, filterState.category);
      final passesRating = _filterByRating(advert, filterState.rating);
      final passesWorkTime = _filterByWorkTime(advert, filterState.workTime);
      final passesDistance =
          await _filterByDistance(advert, filterState.distance);

      if (passesCategory && passesRating && passesWorkTime && passesDistance) {
        filteredAdverts.add(advert);
      }
    }

    return filteredAdverts;
  }

  bool _filterByCategory(Advert advert, String? category) {
    if (category == null || category.isEmpty) return true;
    return advert.categories.contains(category);
  }

  bool _filterByRating(Advert advert, double? rating) {
    if (rating == null) return true;
    return advert.rating >= rating;
  }

  bool _filterByWorkTime(Advert advert, WorkTime? workTime) {
    if (workTime == null) return true;

    final now = DateTime.now();
    final currentDay = Weekday.values[
        now.weekday - 1]; // DateTime.weekday: Monday is 1, ..., Sunday is 7

    switch (workTime) {
      case WorkTime.aroundTheClock:
        return advert.schedule.any(
          (time) =>
              time.day == currentDay &&
              time.from == '00:00' &&
              time.to == '00:00',
        );
      case WorkTime.open:
        final currentTime =
            "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
        return advert.schedule.any(
          (time) =>
              time.day == currentDay &&
              time.from.compareTo(currentTime) <= 0 &&
              time.to.compareTo(currentTime) >= 0,
        );
      default:
        return true;
    }
  }

  Future<bool> _filterByDistance(Advert advert, Distance? distance) async {
    if (distance == null) return true;

    // Get the user's current location
    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    final userCoordinates = (position.latitude, position.longitude);

    // Calculate the distance between the user's location and the advert's location
    final advertCoordinates = advert.location.coordinates;
    final distanceInKm = calculateDistance(userCoordinates, advertCoordinates);

    switch (distance) {
      case Distance.near:
        return distanceInKm <= 1; // Adjust this threshold as needed
      case Distance.fiveKm:
        return distanceInKm <= 5;
      case Distance.tenKm:
        return distanceInKm <= 10;
      default:
        return true;
    }
  }
}
