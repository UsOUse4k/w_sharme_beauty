part of 'get_messages_bloc.dart';

@freezed
class GetMessagesEvent with _$GetMessagesEvent {
  const factory GetMessagesEvent.getMessages({required String chatRoomId}) =
      _GetMessages;
  const factory GetMessagesEvent.addNewMessage(Message message) = _AddNewMessage;
}
