part of 'chat_group_check_manager_bloc.dart';

@freezed
class ChatGroupCheckManagerState with _$ChatGroupCheckManagerState {
  const factory ChatGroupCheckManagerState.selectedManager({
    @Default([]) List<String> administrator,
    @Default([]) List<String> editors,
    @Default('') String groupId,
  }) = _SelectedManager;
}
