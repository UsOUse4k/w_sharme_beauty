part of 'like_community_post_bloc.dart';

@freezed
class LikeCommunityPostState with _$LikeCommunityPostState {
  const factory LikeCommunityPostState.selectedPosts({
    @Default([]) List<Post> selectedPosts,
  }) = _SelectedPosts;
}
