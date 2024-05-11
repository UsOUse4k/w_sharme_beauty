part of 'get_messages_bloc.dart';

@freezed
class GetMessagesState with _$GetMessagesState {
  const factory GetMessagesState.initial() = _Initial;
  const factory GetMessagesState.loading() = _Loading;
  const factory GetMessagesState.error({required String message}) = _Error;
  const factory GetMessagesState.success(List<Message> messages) = _Success;
}
