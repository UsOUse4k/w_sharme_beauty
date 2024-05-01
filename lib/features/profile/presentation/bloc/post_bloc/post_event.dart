part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.started() = _Started;
  const factory PostEvent.createPost(Post post, List<Uint8List> imageFiles) = _CreatePost;
  const factory PostEvent.getMePosts() = _GetMePost;
}
