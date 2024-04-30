// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      uid: json['uid'] as String?,
      postId: json['postId'] as String?,
      text: json['text'] as String,
      imageUrl: json['imageUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      likes: json['likes'] as int? ?? 0,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reposts: json['reposts'] as int? ?? 0,
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdAt: const TimestampConverter()
          .fromJson(json['createdAt'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'postId': instance.postId,
      'text': instance.text,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'likes': instance.likes,
      'comments': instance.comments,
      'reposts': instance.reposts,
      'isFavorite': instance.isFavorite,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
