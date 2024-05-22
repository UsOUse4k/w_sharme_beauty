part of 'unsubscribe_bloc.dart';

@freezed
class UnsubscribeState with _$UnsubscribeState {
  const factory UnsubscribeState.initial() = _Initial;
  const factory UnsubscribeState.success() = _Success;
  const factory UnsubscribeState.error({required String message}) = _Error;
  const factory UnsubscribeState.loading() = _Loading;
}
