part of 'community_comment_likes_bloc.dart';

@freezed
class CommunityCommentLikesEvent with _$CommunityCommentLikesEvent {
  const factory CommunityCommentLikesEvent.likesOfComment({
    String? commentId,
    String? subCommentId,
    String? postId,
    required bool isLiked,
  }) = _LikesOfComment;
}
