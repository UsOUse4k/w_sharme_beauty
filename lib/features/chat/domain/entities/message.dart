import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    String? message,
    String? messageId,
    String? senderId,
    String? receiverId,
    String? username,
    String? avatarUrl,
    String? image,
    String? video,
    @TimestampConverter() Timestamp? timestamp,
    bool? seen,
    String? messageType,
    String? posdId,
    String? postUsername,
    String? postAvatar,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  factory Message.fromStoreData(Map<String, dynamic> firestoreData) {
    return Message(
      message: firestoreData['message'] as String?,
      messageId: firestoreData['messageId'] as String?,
      posdId: firestoreData['posdId'] as String?,
      senderId: firestoreData['senderId'] as String?,
      timestamp: firestoreData['timestamp'] as Timestamp?,
      seen: firestoreData['seen'] as bool?,
      messageType: firestoreData['messageType'] as String?,
      username: firestoreData['username'] as String?,
      avatarUrl: firestoreData['avatarUrl'] as String?,
      image: firestoreData['image'] as String?,
      video: firestoreData['video'] as String?,
      postUsername: firestoreData['postUsername'] as String?,
      postAvatar: firestoreData['postAvatar'] as String?,
    );
  }
}
