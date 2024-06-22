// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(Map json) =>
    _$NotificationModelImpl(
      type: json['type'] as String?,
      fromUser: json['fromUser'] as String?,
      contentId: json['contentId'] as String?,
      notificationId: json['notificationId'] as String?,
      toUser: json['toUser'] as String?,
      username: json['username'] as String?,
      userAvatarUrl: json['userAvatarUrl'] as String?,
      postImageUrl: json['postImageUrl'] as String?,
      createAt: const TimestampConverter().fromJson(json['createAt']),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'fromUser': instance.fromUser,
      'contentId': instance.contentId,
      'notificationId': instance.notificationId,
      'toUser': instance.toUser,
      'username': instance.username,
      'userAvatarUrl': instance.userAvatarUrl,
      'postImageUrl': instance.postImageUrl,
      'createAt': const TimestampConverter().toJson(instance.createAt),
    };
