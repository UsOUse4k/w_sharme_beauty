part of 'user_detail_bloc.dart';

@freezed
class UserDetailState with _$UserDetailState {
  const factory UserDetailState.initial() = _Initial;
  const factory UserDetailState.success(UserProfile userData) = _Success;
  const factory UserDetailState.loading() = _Loading;
  const factory UserDetailState.error({required String message}) = _Error;
}
