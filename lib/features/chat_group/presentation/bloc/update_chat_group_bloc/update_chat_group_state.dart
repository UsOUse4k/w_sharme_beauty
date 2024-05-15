part of 'update_chat_group_bloc.dart';

@freezed
class UpdateChatGroupState with _$UpdateChatGroupState {
  const factory UpdateChatGroupState.initial() = _Initial;
  const factory UpdateChatGroupState.loading() = _Loading;
  const factory UpdateChatGroupState.error({required String message}) = _Error;
  const factory UpdateChatGroupState.success() = _Success;
}
