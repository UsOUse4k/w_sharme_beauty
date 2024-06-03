part of 'create_notification_bloc.dart';

@freezed
class CreateNotificationState with _$CreateNotificationState {
  const factory CreateNotificationState.initial() = _Initial;
  const factory CreateNotificationState.loading() = _Loading;
  const factory CreateNotificationState.error({required String message}) = _Error;
  const factory CreateNotificationState.success(NotificationModel notification) = _Success;
}
