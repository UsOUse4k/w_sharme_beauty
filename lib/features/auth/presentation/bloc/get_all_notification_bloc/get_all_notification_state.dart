part of 'get_all_notification_bloc.dart';

@freezed
class GetAllNotificationState with _$GetAllNotificationState {
  const factory GetAllNotificationState.initial() = _Initial;
  const factory GetAllNotificationState.success(List<NotificationModel> notification) = _Success;
  const factory GetAllNotificationState.loading() = _Loading;
  const factory GetAllNotificationState.error({required String message}) = _Error;
}
