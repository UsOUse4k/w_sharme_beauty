part of 'send_message_group_bloc.dart';

@freezed
class SendMessageGroupEvent with _$SendMessageGroupEvent {
  const factory SendMessageGroupEvent.sendMessage({
    required String groupId,
    required String message,
    Uint8List? file,
  }) = _SendMessage;
}
