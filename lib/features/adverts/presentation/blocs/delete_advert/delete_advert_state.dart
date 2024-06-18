part of 'delete_advert_cubit.dart';

@freezed
class DeleteAdvertState with _$DeleteAdvertState {
  const factory DeleteAdvertState.initial() = _Initial;
  const factory DeleteAdvertState.actionInProgress() = _ActionInProgress;
  const factory DeleteAdvertState.deleteFailure(AdvertFailure failure) =
      _DeleteFailure;
  const factory DeleteAdvertState.deleteSuccess() = _DeleteSuccess;
}
