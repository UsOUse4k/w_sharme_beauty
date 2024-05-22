part of 'get_all_chat_group_bloc.dart';

@freezed
class GetAllChatGroupState with _$GetAllChatGroupState {
  const factory GetAllChatGroupState.initial() = _Initial;
  const factory GetAllChatGroupState.loading() = _Loading;
  const factory GetAllChatGroupState.success(ChatGroupRoom group) = _Success;
  const factory GetAllChatGroupState.error({required String message}) = _Error;
}
