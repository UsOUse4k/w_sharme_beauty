part of 'get_all_group_messages_bloc.dart';

@freezed
class GetAllGroupMessagesEvent with _$GetAllGroupMessagesEvent {
  const factory GetAllGroupMessagesEvent.getAllGroupMessages({
    required String groupId,
    required String communityId,
  }) = _GetAllGroupMessages;
}
