part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = _Initial;
  const factory PostState.loading() = _Loading;
  const factory PostState.loaded({required List<Post> posts}) = _Loaded;
  const factory PostState.error({required String message}) = _Error;

}
