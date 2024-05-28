part of 'update_new_email_bloc.dart';

@freezed
class UpdateNewEmailState with _$UpdateNewEmailState {
  const factory UpdateNewEmailState.initial() = _Initial;
  const factory UpdateNewEmailState.success() = _Success;
  const factory UpdateNewEmailState.loading() = _Loading;
  const factory UpdateNewEmailState.error({required String message}) = _Error;
}
