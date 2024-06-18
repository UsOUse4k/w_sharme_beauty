import 'package:intl/intl.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';

String getTime(List<Time> schedule) {
  final now = DateTime.now();
  final todaySchedule =
      schedule[now.weekday - 1]; // DateTime.weekday is 1 (Monday) to 7 (Sunday)
  final currentTime = DateFormat('HH:mm').format(now);

  if (currentTime.compareTo(todaySchedule.from) >= 0 &&
      currentTime.compareTo(todaySchedule.to) <= 0) {
    return "Открыто до ${todaySchedule.to}";
  }

  return "Закрыто";
}
