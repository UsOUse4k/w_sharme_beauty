part of 'update_manager_chat_group_bloc.dart';

@freezed
class UpdateManagerChatGroupState with _$UpdateManagerChatGroupState {
  const factory UpdateManagerChatGroupState.initial() = _Initial;
  const factory UpdateManagerChatGroupState.loading() = _Loading;
  const factory UpdateManagerChatGroupState.error({required String message}) = _Error;
  const factory UpdateManagerChatGroupState.success() = _Success;
}
