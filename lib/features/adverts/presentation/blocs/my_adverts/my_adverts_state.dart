part of 'my_adverts_cubit.dart';

@freezed
class MyAdvertsState with _$MyAdvertsState {
  const factory MyAdvertsState.initial() = _Initial;
  const factory MyAdvertsState.loadInProgress() = _LoadInProgress;
  const factory MyAdvertsState.loadSuccess(List<Advert> adverts) = _LoadSuccess;
  const factory MyAdvertsState.loadFailure(AdvertFailure advertFailure) =
      _LoadFailure;
}
