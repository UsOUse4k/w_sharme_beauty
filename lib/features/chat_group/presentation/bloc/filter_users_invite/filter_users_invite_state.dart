part of 'filter_users_invite_bloc.dart';

@freezed
class FilterUsersInviteState with _$FilterUsersInviteState {
  const factory FilterUsersInviteState.initial() = _Initial;
  const factory FilterUsersInviteState.filterUsers(List<UserProfile> filterUsers) = _FilterUsers;

}
