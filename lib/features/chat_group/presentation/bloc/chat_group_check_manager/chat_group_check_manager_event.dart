part of 'chat_group_check_manager_bloc.dart';

@freezed
class ChatGroupCheckManagerEvent with _$ChatGroupCheckManagerEvent {
  const factory ChatGroupCheckManagerEvent.editManagerAdministrator({
    required String userId,
  }) = _EditManagerAdministrator;
  const factory ChatGroupCheckManagerEvent.editManagerEditor({
    required String userId,
  }) = _EditManagerEditor;
  const factory ChatGroupCheckManagerEvent.getAllAdministrator({
    required List<String> administrator,
    required List<String> editors,
    required String groupId,
  }) = _GetAllAdministrator;
}
