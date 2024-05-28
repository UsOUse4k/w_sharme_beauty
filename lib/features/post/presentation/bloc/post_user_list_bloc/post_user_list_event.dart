part of 'post_user_list_bloc.dart';

@freezed
class PostUserListEvent with _$PostUserListEvent {
  const factory PostUserListEvent.getUserPosts({String? userId}) = _GetUserPosts;
  const factory PostUserListEvent.addNewPosts({required Post post}) = _AddNewPost;
  const factory PostUserListEvent.filterPost({required String value}) = _FilterPost;
}
