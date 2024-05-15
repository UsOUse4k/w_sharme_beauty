import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

part 'chat_group_room.freezed.dart';
part 'chat_group_room.g.dart';

@freezed
class ChatGroupRoom with _$ChatGroupRoom {
  const factory ChatGroupRoom({
    String? groupName,
    String? groupProfileImage,
    List<String>? joinedUserIds,
    List<String>? administrator,
    List<String>? editors,
    int? limitUsers,
    String? userId,
    String? lastSenderId,
    @TimestampConverter() Timestamp? createdAt,
    Map<String, String>? userRoles,
    String? groupId,
    String? lastMessage,
    @TimestampConverter() Timestamp? lastMessageTs,
    int? countMessage,
    bool? isActive,
    bool? seen,
  }) = _ChatGroupRoom;

  factory ChatGroupRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatGroupRoomFromJson(json);

  factory ChatGroupRoom.fromFirestore(Map<String, dynamic> firestoreData) {
    return ChatGroupRoom(
      groupName: firestoreData['groupName'] as String?,
      groupProfileImage: firestoreData['groupProfileImage'] as String?,
      userRoles: firestoreData['userRoles'] as Map<String, String>?,
      limitUsers: firestoreData['limitUsers'] as int?,
      userId: firestoreData['userId'] as String?,
      createdAt: firestoreData['createdAt'] as Timestamp?,
      lastMessageTs: firestoreData['lastMessageTs'] as Timestamp?,
      groupId: firestoreData['groupId'] as String?,
      lastMessage: firestoreData['lastMessage'] as String?,
      countMessage: firestoreData['countMessage'] as int?,
      isActive: firestoreData['isActive'] as bool?,
      seen: firestoreData['seen'] as bool?,
      joinedUserIds: (firestoreData['joinedUserIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      administrator: (firestoreData['administrator'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      editors: (firestoreData['editors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      lastSenderId: firestoreData['lastSenderId'] as String?,
    );
  }
}