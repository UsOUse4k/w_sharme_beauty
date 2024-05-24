part of 'get_all_users_bloc.dart';

@freezed
class GetAllUsersState with _$GetAllUsersState {
  const factory GetAllUsersState.initial() = _Initial;
  const factory GetAllUsersState.success(List<UserProfile> users) = _Success;
  const factory GetAllUsersState.loading() = _Loading;
  const factory GetAllUsersState.error({required String error}) = _Error;
}
