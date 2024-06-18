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
      lastMessageTs: const TimestampConverter().fromJson(json['lastMessageTs']),
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      seen: json['seen'] as bool?,
      messageCount: json['messageCount'] as int?,
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'lastMessage': instance.lastMessage,
      'lastSenderId': instance.lastSenderId,
      'receiverId': instance.receiverId,
      'receiverUsername': instance.receiverUsername,
      'lastMessageTs':
          const TimestampConverter().toJson(instance.lastMessageTs),
      'members': instance.members,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'seen': instance.seen,
      'messageCount': instance.messageCount,
    };
