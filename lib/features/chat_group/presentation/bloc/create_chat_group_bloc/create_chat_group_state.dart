part of 'create_chat_group_bloc.dart';

@freezed
class CreateChatGroupState with _$CreateChatGroupState {
  const factory CreateChatGroupState.initial() = _Initial;
  const factory CreateChatGroupState.loading() = _Loading;
  const factory CreateChatGroupState.success({required String groupId}) = _Success;
  const factory CreateChatGroupState.error({required String message}) = _Error;

}
