part of 'subscibe_post_bloc.dart';

@freezed
class SubscibePostEvent with _$SubscibePostEvent {
  const factory SubscibePostEvent.subscibe({
    String? targetUid,
    String? postId,
    String? authorId,
  }) = _Subscribe;
  const factory SubscibePostEvent.unsubscibe({
    String? targetUid,
    String? postId,
    String? authorId,
  }) = _Unsubscibe;
}
