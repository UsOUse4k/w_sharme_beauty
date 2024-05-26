part of 'subscibe_post_bloc.dart';

@freezed
class SubscibePostState with _$SubscibePostState {
  const factory SubscibePostState.initial() = _Initial;
  const factory SubscibePostState.success() = _Success;
  const factory SubscibePostState.loading() = _Loading;
  const factory SubscibePostState.error({required String message}) = _Error;
}
