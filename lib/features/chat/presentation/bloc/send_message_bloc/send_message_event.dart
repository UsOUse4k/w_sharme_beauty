part of 'send_message_bloc.dart';

@freezed
class SendMessageEvent with _$SendMessageEvent {
  const factory SendMessageEvent.sendMessage({
    required String chatRoomId,
    required String message,
    required String receiverId,
    Uint8List? file,
  }) = _Started;
}
