part of 'filter_users_invite_bloc.dart';

@freezed
class FilterUsersInviteEvent with _$FilterUsersInviteEvent {
  const factory FilterUsersInviteEvent.loaded(
    List<UserProfile> users,
    String currentUid,
  ) = _Loaded;
  const factory FilterUsersInviteEvent.searchUsers({
    required String query,
  }) = _SearchUsers;
}
