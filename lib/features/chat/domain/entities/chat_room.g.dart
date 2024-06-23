// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomImpl _$$ChatRoomImplFromJson(Map json) => _$ChatRoomImpl(
      chatRoomId: json['chatRoomId'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastSenderId: json['lastSenderId'] as String?,
      receiverId: json['receiverId'] as String?,
      receiverUsername: json['receiverUsername'] as String?,
      receiverUserAvatar: json['receiverUserAvatar'] as String?,
      senderUsername: json['senderUsername'] as String?,
      senderUserAvatar: json['senderUserAvatar'] as String?,
      lastMessageTs: const TimestampConverter().fromJson(json['lastMessageTs']),
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      seen: json['seen'] as bool?,
      messageCount: (json['messageCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'lastMessage': instance.lastMessage,
      'lastSenderId': instance.lastSenderId,
      'receiverId': instance.receiverId,
      'receiverUsername': instance.receiverUsername,
      'receiverUserAvatar': instance.receiverUserAvatar,
      'senderUsername': instance.senderUsername,
      'senderUserAvatar': instance.senderUserAvatar,
      'lastMessageTs':
          const TimestampConverter().toJson(instance.lastMessageTs),
      'members': instance.members,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'seen': instance.seen,
      'messageCount': instance.messageCount,
    };
