part of 'subscribe_bloc.dart';

@freezed
class SubscribeState with _$SubscribeState {
  const factory SubscribeState.initial() = _Initial;
  const factory SubscribeState.success( bool subscriptions) = _Success;
  const factory SubscribeState.error({required String message}) = _Error;
  const factory SubscribeState.loading() = _Loading;
}
