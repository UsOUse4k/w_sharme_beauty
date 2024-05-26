part of 'community_add_reply_comment_bloc.dart';

@freezed
class CommunityAddReplyCommentEvent with _$CommunityAddReplyCommentEvent {
  const factory CommunityAddReplyCommentEvent.addReplyComment(
    Comment comment,
    String parentCommentId,
    String postId,
    String communityId,
  ) = _AddReplyComment;
}
