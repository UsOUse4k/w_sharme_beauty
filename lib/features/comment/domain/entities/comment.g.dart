// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      uid: json['uid'] as String? ?? '',
      commentId: json['commentId'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      username: json['username'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'commentId': instance.commentId,
      'comment': instance.comment,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'likes': instance.likes,
      'createdAt': instance.createdAt,
    };
