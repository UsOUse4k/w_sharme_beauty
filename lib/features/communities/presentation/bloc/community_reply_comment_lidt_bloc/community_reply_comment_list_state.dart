part of 'community_reply_comment_list_bloc.dart';

@freezed
class CommunityReplyCommentListState with _$CommunityReplyCommentListState {
  const factory CommunityReplyCommentListState.initial() = _Initial;
  const factory CommunityReplyCommentListState.loading() = _Loading;
  const factory CommunityReplyCommentListState.success({
    required List<Comment> comments,
  }) = _Success;
  const factory CommunityReplyCommentListState.error({required String error}) =
      _Error;
}
