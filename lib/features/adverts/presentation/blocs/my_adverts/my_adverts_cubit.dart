import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

part 'my_adverts_state.dart';
part 'my_adverts_cubit.freezed.dart';

@injectable
class MyAdvertsCubit extends Cubit<MyAdvertsState> {
  MyAdvertsCubit(this._advertRepository)
      : super(const MyAdvertsState.initial());

  final IAdvertRepository _advertRepository;

  Future<void> getAdverts() async {
    emit(const MyAdvertsState.loadInProgress());

    final failureOrAdverts = await _advertRepository.getAdverts(onlyMy: true);
    emit(
      failureOrAdverts.fold(
        (f) => MyAdvertsState.loadFailure(f),
        (adverts) => MyAdvertsState.loadSuccess(adverts),
      ),
    );
  }

  Future<void> addAdvert(Advert advert) async {
    state.maybeWhen(
      loadSuccess: (adverts) async {
        final data = [advert, ...adverts];
        emit(MyAdvertsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  Future<void> updateAdvert(Advert advert) async {
    state.maybeWhen(
      loadSuccess: (adverts) async {
        final data = adverts.map((e) {
          return e.id == advert.id
              ? e.copyWith(
                  images: advert.images,
                  categories: advert.categories,
                  name: advert.name,
                  description: advert.description,
                  location: advert.location,
                  phoneNumber: advert.phoneNumber,
                  schedule: advert.schedule,
                  services: advert.services,
                )
              : e;
        }).toList();
        emit(MyAdvertsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  Future<void> removeAdvert(String advertId) async {
    state.maybeWhen(
      loadSuccess: (adverts) async {
        final data = adverts.where((e) => e.id != advertId).toList();
        emit(MyAdvertsState.loadSuccess(data));
      },
      orElse: () {},
    );
  }
}
