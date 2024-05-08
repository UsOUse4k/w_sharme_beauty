part of 'community_create_post_bloc.dart';

@freezed
class CommunityCreatePostEvent with _$CommunityCreatePostEvent {
  const factory CommunityCreatePostEvent.createPost(
    Post post,
    List<Uint8List> imageFiles,
  ) = _CreatePost;
}
