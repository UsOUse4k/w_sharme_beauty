part of 'added_chat_users_group_bloc.dart';

@freezed
class AddedChatUsersGroupState with _$AddedChatUsersGroupState {
  const factory AddedChatUsersGroupState.selectedState({
    @Default([]) List<UserProfile> selectedUsers,
  }) = _SelectedState;
}
