part of 'send_post_bloc.dart';

@freezed
class SendPostState with _$SendPostState {
  const factory SendPostState.initial() = _Initial;
  const factory SendPostState.success() = _Success;
  const factory SendPostState.error({required String message}) = _Error;
  const factory SendPostState.loading() = _Loading;
}
