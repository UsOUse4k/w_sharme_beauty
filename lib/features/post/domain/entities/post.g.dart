// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map json) => _$PostImpl(
      authorId: json['authorId'] as String?,
      postId: json['postId'] as String?,
      username: json['username'] as String?,
      category: json['category'] as String?,
      text: json['text'] as String,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      avatarUrl: json['avatarUrl'] as String? ?? '',
      videoUrl: json['videoUrl'] as String?,
      commentsCount: json['commentsCount'] as int? ?? 0,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      reposts: (json['reposts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subscriptions: (json['subscriptions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'authorId': instance.authorId,
      'postId': instance.postId,
      'username': instance.username,
      'category': instance.category,
      'text': instance.text,
      'imageUrls': instance.imageUrls,
      'avatarUrl': instance.avatarUrl,
      'videoUrl': instance.videoUrl,
      'commentsCount': instance.commentsCount,
      'likes': instance.likes,
      'reposts': instance.reposts,
      'followers': instance.followers,
      'subscriptions': instance.subscriptions,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt,
    };
