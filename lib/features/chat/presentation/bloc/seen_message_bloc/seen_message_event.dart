part of 'seen_message_bloc.dart';

@freezed
class SeenMessageEvent with _$SeenMessageEvent {
  const factory SeenMessageEvent.seenMessage({required String chatRoomId, required String messageId, required String senderId,}) = _SeenMessage;
}