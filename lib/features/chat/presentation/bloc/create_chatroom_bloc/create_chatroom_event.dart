part of 'create_chatroom_bloc.dart';

@freezed
class CreateChatroomEvent with _$CreateChatroomEvent {
  const factory CreateChatroomEvent.createdChatRoomId({
    required String chatRoomId,
  }) = _Started;
}
