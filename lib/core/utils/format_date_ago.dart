import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatDateTime(Timestamp timestamp) {
  final DateTime dateTime = timestamp.toDate();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  if (aDate == today) {
    return 'сегодня в ${DateFormat('HH:mm').format(dateTime)}';
  } else if (aDate == yesterday) {
    return 'вчера в ${DateFormat('HH:mm').format(dateTime)}';
  } else if (now.difference(dateTime).inDays < 14) {
    return '${(now.difference(dateTime).inDays / 7).floor()} нед.';
  } else if (now.difference(dateTime).inDays < 30) {
    return '${(now.difference(dateTime).inDays / 7).floor()} нед.';
  } else if (now.difference(dateTime).inDays < 365) {
    int months = ((now.year - dateTime.year) * 12) + now.month - dateTime.month;
    // Adjust for cases where the last month isn't complete
    if (dateTime.day > now.day) {
      months -= 1;
    }
    return '$months мес.';
  } else {
    return DateFormat('dd.MM.yyyy').format(dateTime); // e.g., 10.01.2022
  }
}
