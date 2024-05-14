part of 'send_message_group_bloc.dart';

@freezed
class SendMessageGroupState with _$SendMessageGroupState {
  const factory SendMessageGroupState.initial() = _Initial;
  const factory SendMessageGroupState.loading() = _Loading;
  const factory SendMessageGroupState.success() = _Success;
  const factory SendMessageGroupState.error({required String message}) = _Error;

}
