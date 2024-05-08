part of 'community_post_list_bloc.dart';

@freezed
class CommunityPostListEvent with _$CommunityPostListEvent {
  const factory CommunityPostListEvent.getPosts() = _GetPosts;
  const factory CommunityPostListEvent.addPost(Post post) = _AddPost;
}
