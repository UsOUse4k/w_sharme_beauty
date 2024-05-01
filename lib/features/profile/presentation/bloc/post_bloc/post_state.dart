part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = _Initial;
  const factory PostState.loading() = _Loading;
  const factory PostState.success() = _Success;
  const factory PostState.error({required String message}) = _Error;
  const factory PostState.getMePosts(List<Post> posts) = _SuccessGetMePost;
}
