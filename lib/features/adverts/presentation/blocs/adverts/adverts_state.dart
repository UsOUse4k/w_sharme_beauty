part of 'adverts_cubit.dart';

@freezed
class AdvertsState with _$AdvertsState {
  const factory AdvertsState.initial() = _Initial;
  const factory AdvertsState.loadInProgress() = _LoadInProgress;
  const factory AdvertsState.loadSuccess(List<Advert> adverts) = _LoadSuccess;
  const factory AdvertsState.loadFailure(AdvertFailure advertFailure) =
      _LoadFailure;
}
