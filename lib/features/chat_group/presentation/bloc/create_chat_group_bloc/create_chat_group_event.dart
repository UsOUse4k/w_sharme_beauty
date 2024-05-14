part of 'create_chat_group_bloc.dart';

@freezed
class CreateChatGroupEvent with _$CreateChatGroupEvent {
  const factory CreateChatGroupEvent.createChatGroup({
    required ChatGroupRoom chatGroup,
    required Uint8List file,
  }) = _CreateChatGroup;
}
