import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String getUserStatus(Timestamp lastSeen) {
  final now = DateTime.now();
  final lastSeenDate = lastSeen.toDate();
  final difference = now.difference(lastSeenDate);

  if (difference.inMinutes < 5) {
    return 'в сети';
  } else if (now.day == lastSeenDate.day &&
      now.month == lastSeenDate.month &&
      now.year == lastSeenDate.year) {
    return 'был(а) сегодня в ${DateFormat('HH:mm').format(lastSeenDate)}';
  } else if (now
          .difference(DateTime(
              lastSeenDate.year, lastSeenDate.month, lastSeenDate.day - 1,),)
          .inDays ==
      0) {
    return 'был(а) вчера в ${DateFormat('HH:mm').format(lastSeenDate)}';
  } else {
    return 'был(а) ${DateFormat('dd.MM.yyyy в HH:mm').format(lastSeenDate)}';
  }
}
