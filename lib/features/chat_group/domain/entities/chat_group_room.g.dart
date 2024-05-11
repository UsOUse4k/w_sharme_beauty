// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_group_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatGroupRoomImpl _$$ChatGroupRoomImplFromJson(Map<String, dynamic> json) =>
    _$ChatGroupRoomImpl(
      groupName: json['groupName'] as String?,
      groupProfileImage: json['groupProfileImage'] as String?,
      joinedUserIds: (json['joinedUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      inviteOnlyByUserIds: (json['inviteOnlyByUserIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      limitUsers: json['limitUsers'] as int?,
      userId: json['userId'] as String?,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      userRoles: (json['userRoles'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      groupId: json['groupId'] as String?,
      lastMessage: json['lastMessage'] as String?,
      countMessage: json['countMessage'] as int?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$$ChatGroupRoomImplToJson(_$ChatGroupRoomImpl instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'groupProfileImage': instance.groupProfileImage,
      'joinedUserIds': instance.joinedUserIds,
      'inviteOnlyByUserIds': instance.inviteOnlyByUserIds,
      'limitUsers': instance.limitUsers,
      'userId': instance.userId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'userRoles': instance.userRoles,
      'groupId': instance.groupId,
      'lastMessage': instance.lastMessage,
      'countMessage': instance.countMessage,
      'isActive': instance.isActive,
    };
