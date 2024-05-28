// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdvertImpl _$$AdvertImplFromJson(Map<String, dynamic> json) => _$AdvertImpl(
      authorId: json['authorId'] as String?,
      advertId: json['advertId'] as String?,
      sloonName: json['sloonName'] as String?,
      category: json['category'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      description: json['description'] as String?,
      schedule: json['schedule'] as String?,
      productServices: json['productServices'] as String?,
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
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$AdvertImplToJson(_$AdvertImpl instance) =>
    <String, dynamic>{
      'authorId': instance.authorId,
      'advertId': instance.advertId,
      'sloonName': instance.sloonName,
      'category': instance.category,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'schedule': instance.schedule,
      'productServices': instance.productServices,
      'imageUrls': instance.imageUrls,
      'avatarUrl': instance.avatarUrl,
      'videoUrl': instance.videoUrl,
      'commentsCount': instance.commentsCount,
      'likes': instance.likes,
      'reposts': instance.reposts,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt,
    };
