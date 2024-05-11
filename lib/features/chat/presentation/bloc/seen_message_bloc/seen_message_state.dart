part of 'seen_message_bloc.dart';

@freezed
class SeenMessageState with _$SeenMessageState {
  const factory SeenMessageState.initial() = _Initial;
  const factory SeenMessageState.Success() = _Success;
  const factory SeenMessageState.Loading() = _Loading;
  const factory SeenMessageState.Error({required String message}) = _Error;

}
