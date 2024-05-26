part of 'get_all_users_bloc.dart';

@freezed
class GetAllUsersEvent with _$GetAllUsersEvent {
  const factory GetAllUsersEvent.getAllUsers() = _GetAllUsers;
  const factory GetAllUsersEvent.searchUsers({required String query}) = _SearchUsers;

}
