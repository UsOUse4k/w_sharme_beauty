part of 'community_comment_likes_bloc.dart';

@freezed
class CommunityCommentLikesState with _$CommunityCommentLikesState {
  const factory CommunityCommentLikesState.initial() = _Initial;
  const factory CommunityCommentLikesState.loading() = _Loading;
  const factory CommunityCommentLikesState.success() = _Success;
  const factory CommunityCommentLikesState.error() = _Error;
}
