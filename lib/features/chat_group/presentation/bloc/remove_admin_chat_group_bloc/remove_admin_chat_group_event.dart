part of 'remove_admin_chat_group_bloc.dart';

@freezed
class RemoveAdminChatGroupEvent with _$RemoveAdminChatGroupEvent {
  const factory RemoveAdminChatGroupEvent.removeAdmin({
    required String userId,
    required String groupId,
    required String type,
    required String communityId,

  }) = _RemoveAdmin;
}
