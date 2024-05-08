part of 'community_post_list_bloc.dart';

@freezed
class CommunityPostListState with _$CommunityPostListState {
  const factory CommunityPostListState.initial() = _Initial;
  const factory CommunityPostListState.loading() = _Loading;
  const factory CommunityPostListState.notSignedIn() = _NotSignedIn;
  const factory CommunityPostListState.success(List<Post> posts) = _Success;
  const factory CommunityPostListState.error({required String message}) =
      _Error;
}
