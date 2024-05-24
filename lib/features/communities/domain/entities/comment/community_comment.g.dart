// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityCommentImpl _$$CommunityCommentImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityCommentImpl(
      uid: json['uid'] as String? ?? '',
      commentId: json['commentId'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      username: json['username'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      replies: json['replies'] as int? ?? 0,
      parentCommentId: json['parentCommentId'] as String? ?? '',
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$CommunityCommentImplToJson(
        _$CommunityCommentImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'commentId': instance.commentId,
      'comment': instance.comment,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'likes': instance.likes,
      'replies': instance.replies,
      'parentCommentId': instance.parentCommentId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
