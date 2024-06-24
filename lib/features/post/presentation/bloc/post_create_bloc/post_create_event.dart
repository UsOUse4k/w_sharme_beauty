part of 'post_create_bloc.dart';

@freezed
class PostCreateEvent with _$PostCreateEvent {
  const factory PostCreateEvent.createPost({
    required Post post,
    List<Uint8List>? imageFiles,
    XFile? video,
  }) = _CreatePost;
}
