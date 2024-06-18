part of 'replies_cubit.dart';

@freezed
class RepliesState with _$RepliesState {
  const factory RepliesState.initial() = _Initial;
  const factory RepliesState.loadInProgress() = _LoadInProgress;
  const factory RepliesState.loadSuccess(List<Reply> replies) = _LoadSuccess;
  const factory RepliesState.loadFailure(AdvertFailure advertFailure) =
      _LoadFailure;
}
