part of 'added_chat_users_group_bloc.dart';

@freezed
class AddedChatUsersGroupEvent with _$AddedChatUsersGroupEvent {
  const factory AddedChatUsersGroupEvent.toggleSelectedUsers(UserProfile user) = _ToggleSelectedUsers;
}
