part of 'search_adverts_cubit.dart';

@freezed
class SearchAdvertsState with _$SearchAdvertsState {
  const factory SearchAdvertsState.initial() = _Initial;
  const factory SearchAdvertsState.loadInProgress() = _LoadInProgress;
  const factory SearchAdvertsState.loadSuccess(List<Advert> adverts) = _LoadSuccess;
  const factory SearchAdvertsState.loadFailure(AdvertFailure advertFailure) =
      _LoadFailure;
}
