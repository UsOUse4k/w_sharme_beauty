part of 'community_comment_list_bloc.dart';

@freezed
class CommunityCommentListState with _$CommunityCommentListState {
  const factory CommunityCommentListState.initial() = _Initial;
  const factory CommunityCommentListState.loading() = _Loading;
  const factory CommunityCommentListState.success(List<Comment> comments) =
      _Success;
  const factory CommunityCommentListState.error({required String error}) =
      _Error;
}
