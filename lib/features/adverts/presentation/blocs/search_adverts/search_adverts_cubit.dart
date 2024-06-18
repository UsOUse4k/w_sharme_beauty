import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'search_adverts_state.dart';
part 'search_adverts_cubit.freezed.dart';

@injectable
class SearchAdvertsCubit extends Cubit<SearchAdvertsState> {
  SearchAdvertsCubit(this._repository)
      : super(const SearchAdvertsState.initial());

  final IAdvertRepository _repository;
  List<Advert> _adverts = [];

  Future<void> getAdverts() async {
    emit(const SearchAdvertsState.loadInProgress());

    final failureOrAdverts = await _repository.getAdverts();

    failureOrAdverts.fold(
      (f) {
        emit(SearchAdvertsState.loadFailure(f));
      },
      (adverts) {
        _adverts = adverts;
        emit(const SearchAdvertsState.loadSuccess([]));
      },
    );
  }

  Future<void> searchAdvert(String queryText) async {
    state.maybeWhen(
      loadSuccess: (_) async {
        if (queryText.isEmpty) {
          emit(const SearchAdvertsState.loadSuccess([]));

          return;
        }

        final queryTextFormatted = queryText.trim().toLowerCase();

        final data = _adverts.where(
          (advert) {
            return advert.name.toLowerCase().contains(queryTextFormatted) ||
                advert.description.toLowerCase().contains(queryTextFormatted) ||
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
        emit(SearchAdvertsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }
}
