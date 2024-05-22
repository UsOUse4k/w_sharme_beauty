part of 'community_reply_comment_list_bloc.dart';

@freezed
class CommunityReplyCommentListEvent with _$CommunityReplyCommentListEvent {
  const factory CommunityReplyCommentListEvent.getCommunityReplyComments({
    required String postId,
    required String parentCommentId,
  }) = _GetCommunityReplyComments;
  const factory CommunityReplyCommentListEvent.addNewCommunityComments(
    Comment comment,
  ) = _AddNewCommunityComments;
}
