part of 'comment_likes_bloc.dart';

@freezed
class CommentLikesEvent with _$CommentLikesEvent {
  const factory CommentLikesEvent.likeComment({
    String? commentId,
    String? subCommentId,
    String? postId,
    required bool isLiked
  }) = _LikeComment;
}
