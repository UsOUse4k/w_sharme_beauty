part of 'comment_likes_bloc.dart';

@freezed
class CommentLikesState with _$CommentLikesState {
  const factory CommentLikesState.initial() = _Initial;
  const factory CommentLikesState.loading() = _Loading;
  const factory CommentLikesState.success() =
      _Success;
  const factory CommentLikesState.error() = _Error;
}
