part of 'create_notification_bloc.dart';

@freezed
class CreateNotificationEvent with _$CreateNotificationEvent {
  const factory CreateNotificationEvent.created({
    required String type,
    required String fromUser,
    required String contentId,
    String? postImagUrl,
  }) = _Created;
}
