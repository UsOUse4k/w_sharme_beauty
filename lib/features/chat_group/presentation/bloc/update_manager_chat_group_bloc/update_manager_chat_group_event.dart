part of 'update_manager_chat_group_bloc.dart';

@freezed
class UpdateManagerChatGroupEvent with _$UpdateManagerChatGroupEvent {
  const factory UpdateManagerChatGroupEvent.updateManagerChatGroup({
    required List<String> editors,
    required List<String> administrator,
    required String groupId,
    required String communityId,

  }) = _UpdateManagerChatGroup;
}
