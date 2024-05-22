part of 'invite_users_chat_group_bloc.dart';

@freezed
class InviteUsersChatGroupEvent with _$InviteUsersChatGroupEvent {
  const factory InviteUsersChatGroupEvent.inviteUsersChatGroup({
    required List<String> userIds,
    required String groupId,
    required String communityId,
  }) = _InviteUsersChatGroup;
}
