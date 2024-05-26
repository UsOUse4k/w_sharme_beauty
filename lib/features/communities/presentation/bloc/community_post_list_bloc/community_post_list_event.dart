part of 'community_post_list_bloc.dart';

@freezed
class CommunityPostListEvent with _$CommunityPostListEvent {
  const factory CommunityPostListEvent.getPosts({required String communityId}) = _GetPosts;
  const factory CommunityPostListEvent.addPost(Post post) = _AddPost;
    const factory CommunityPostListEvent.filterCommunityPost({required String title}) = _FilterCommunityPost;
}
