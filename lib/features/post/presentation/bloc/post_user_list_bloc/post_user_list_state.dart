part of 'post_user_list_bloc.dart';

@freezed
class PostUserListState with _$PostUserListState {
  const factory PostUserListState.initial() = _Initial;
  const factory PostUserListState.loading() = _Loading;
  const factory PostUserListState.error({required String message}) = _Error;
  const factory PostUserListState.success(List<Post> posts) = _Success;
}
