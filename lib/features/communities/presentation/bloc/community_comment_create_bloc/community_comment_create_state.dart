part of 'community_comment_create_bloc.dart';

@freezed
class CommunityCommentCreateState with _$CommunityCommentCreateState {
  const factory CommunityCommentCreateState.initial() = _Initial;
  const factory CommunityCommentCreateState.success(Comment comment) = _Success;
  const factory CommunityCommentCreateState.error() = _Error;
  const factory CommunityCommentCreateState.loading() = _Loading;
}
