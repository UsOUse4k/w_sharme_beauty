part of 'get_all_notification_bloc.dart';

@freezed
class GetAllNotificationEvent with _$GetAllNotificationEvent {
  const factory GetAllNotificationEvent.loaded() =
      _Loaded;
  const factory GetAllNotificationEvent.addNewNotification({
    required NotificationModel notification,
  }) = _addNewNotification;
  
}
