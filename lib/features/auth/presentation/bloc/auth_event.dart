part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.register(String email, String password) = _Register;
  const factory AuthEvent.login(String email, String password) = _Login;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.resetPassword(String email) = _ResetPassword;
  const factory AuthEvent.saveData(String data) = _SaveData;
}
