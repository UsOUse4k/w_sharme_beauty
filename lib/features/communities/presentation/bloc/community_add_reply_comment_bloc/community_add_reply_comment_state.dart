part of 'community_add_reply_comment_bloc.dart';

@freezed
class CommunityAddReplyCommentState with _$CommunityAddReplyCommentState {
  const factory CommunityAddReplyCommentState.initial() = _Initial;
  const factory CommunityAddReplyCommentState.success(Comment comment) =
      _Success;
  const factory CommunityAddReplyCommentState.error({required String error}) =
      _Error;
  const factory CommunityAddReplyCommentState.loading() = _Loading;
}
