part of 'community_comment_list_bloc.dart';

@freezed
class CommunityCommentListEvent with _$CommunityCommentListEvent {
  const factory CommunityCommentListEvent.getCommunityComments({
    required String postId,
  }) = _GetCommunityComments;
  const factory CommunityCommentListEvent.addCommunityNewComments(
    Comment comment,
  ) = _AddCommunityNewComments;
}
