part of 'seen_message_bloc.dart';

@freezed
class SeenMessageState with _$SeenMessageState {
  const factory SeenMessageState.initial() = _Initial;
  const factory SeenMessageState.success() = _Success;
  const factory SeenMessageState.loading() = _Loading;
  const factory SeenMessageState.error({required String message}) = _Error;

}
