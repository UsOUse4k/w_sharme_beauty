import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    String? type,
    String? fromUser,
    String? contentId,
    String? notificationId,
    String? toUser,
    String? username,
    String? userAvatarUrl,
    String? postImageUrl,
    @TimestampConverter() Timestamp? createAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  factory NotificationModel.fromFirestore(Map<String, dynamic> firestoreData) {
    return NotificationModel(
      type: firestoreData['type'] as String?,
      notificationId: firestoreData['notificationId'] as String?,
      fromUser: firestoreData['fromUser'] as String? ?? '',
      contentId: firestoreData['contentId'] as String? ?? '',
      toUser: firestoreData['toUser'] as String? ?? '',
      createAt: firestoreData['createAt'] as Timestamp?,
      username: firestoreData['username'] as String? ?? '',
      userAvatarUrl: firestoreData['userAvatarUrl'] as String?,
      postImageUrl: firestoreData['postImageUrl'] as String?,
    );
  }
}
