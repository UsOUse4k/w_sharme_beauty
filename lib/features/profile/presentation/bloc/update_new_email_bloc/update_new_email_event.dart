part of 'update_new_email_bloc.dart';

@freezed
class UpdateNewEmailEvent with _$UpdateNewEmailEvent {
  const factory UpdateNewEmailEvent.updateNewEmail({required String email}) = _UpdateNewEmail;
}
