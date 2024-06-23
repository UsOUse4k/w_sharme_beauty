// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map json) => _$MessageImpl(
      message: json['message'] as String?,
      messageId: json['messageId'] as String?,
      senderId: json['senderId'] as String?,
      receiverId: json['receiverId'] as String?,
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      image: json['image'] as String?,
      timestamp: const TimestampConverter().fromJson(json['timestamp']),
      seen: json['seen'] as bool?,
      messageType: json['messageType'] as String?,
      posdId: json['posdId'] as String?,
      postUsername: json['postUsername'] as String?,
      postAvatar: json['postAvatar'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'image': instance.image,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'seen': instance.seen,
      'messageType': instance.messageType,
      'posdId': instance.posdId,
      'postUsername': instance.postUsername,
      'postAvatar': instance.postAvatar,
    };
