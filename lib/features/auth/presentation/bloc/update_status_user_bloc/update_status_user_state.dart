part of 'update_status_user_bloc.dart';

@freezed
class UpdateStatusUserState with _$UpdateStatusUserState {
  const factory UpdateStatusUserState.initial() = _Initial;
  const factory UpdateStatusUserState.loading() = _Loading;
  const factory UpdateStatusUserState.success() = _Success;
  const factory UpdateStatusUserState.error({required String error}) = _Error;

}
