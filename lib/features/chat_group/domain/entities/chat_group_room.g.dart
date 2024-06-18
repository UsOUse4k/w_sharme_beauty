// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_group_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatGroupRoomImpl _$$ChatGroupRoomImplFromJson(Map json) =>
    _$ChatGroupRoomImpl(
      communityId: json['communityId'] as String?,
      groupName: json['groupName'] as String?,
      groupProfileImage: json['groupProfileImage'] as String?,
      joinedUserIds: (json['joinedUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      administrator: (json['administrator'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      editors:
          (json['editors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      limitUsers: json['limitUsers'] as int?,
      userId: json['userId'] as String?,
      lastSenderId: json['lastSenderId'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      userRoles: (json['userRoles'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as String),
      ),
      groupId: json['groupId'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastMessageTs: const TimestampConverter().fromJson(json['lastMessageTs']),
      countMessage: json['countMessage'] as int?,
      isActive: json['isActive'] as bool?,
      seen: json['seen'] as bool?,
    );

Map<String, dynamic> _$$ChatGroupRoomImplToJson(_$ChatGroupRoomImpl instance) =>
    <String, dynamic>{
      'communityId': instance.communityId,
      'groupName': instance.groupName,
      'groupProfileImage': instance.groupProfileImage,
      'joinedUserIds': instance.joinedUserIds,
      'administrator': instance.administrator,
      'editors': instance.editors,
      'limitUsers': instance.limitUsers,
      'userId': instance.userId,
      'lastSenderId': instance.lastSenderId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'userRoles': instance.userRoles,
      'groupId': instance.groupId,
      'lastMessage': instance.lastMessage,
      'lastMessageTs':
          const TimestampConverter().toJson(instance.lastMessageTs),
      'countMessage': instance.countMessage,
      'isActive': instance.isActive,
      'seen': instance.seen,
    };
