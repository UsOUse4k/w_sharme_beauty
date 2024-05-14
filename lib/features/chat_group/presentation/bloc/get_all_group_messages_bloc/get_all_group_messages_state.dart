part of 'get_all_group_messages_bloc.dart';

@freezed
class GetAllGroupMessagesState with _$GetAllGroupMessagesState {
  const factory GetAllGroupMessagesState.initial() = _Initial;
  const factory GetAllGroupMessagesState.loading() = _Loading;
  const factory GetAllGroupMessagesState.success(List<Message> messages) = _Success;
  const factory GetAllGroupMessagesState.error({required String message}) = _Error;

}
