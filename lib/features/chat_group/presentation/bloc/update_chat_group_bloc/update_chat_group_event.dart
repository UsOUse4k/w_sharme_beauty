part of 'update_chat_group_bloc.dart';

@freezed
class UpdateChatGroupEvent with _$UpdateChatGroupEvent {
  const factory UpdateChatGroupEvent.updateChatGroup({
    required String groupId,
    String? groupName,
    Uint8List? file,
  }) = _UpdateChatGroup;
}
