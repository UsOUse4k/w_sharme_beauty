// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      message: json['message'] as String?,
      messageId: json['messageId'] as String?,
      senderId: json['senderId'] as String?,
      receiverId: json['receiverId'] as String?,
      timestamp: const TimestampConverter().fromJson(json['timestamp']),
      seen: json['seen'] as bool?,
      messageType: json['messageType'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'seen': instance.seen,
      'messageType': instance.messageType,
    };
