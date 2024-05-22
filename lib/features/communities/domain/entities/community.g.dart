// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityImpl _$$CommunityImplFromJson(Map<String, dynamic> json) =>
    _$CommunityImpl(
      communityId: json['communityId'] as String?,
      uid: json['uid'] as String?,
      chatGroupId: json['chatGroupId'] as String?,
      communityName: json['communityName'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      administrator: (json['administrator'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      editors: (json['editors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      avatarUrls: json['avatarUrls'] as String? ?? "",
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      public: json['public'] as int? ?? 0,
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? "",
    );

Map<String, dynamic> _$$CommunityImplToJson(_$CommunityImpl instance) =>
    <String, dynamic>{
      'communityId': instance.communityId,
      'uid': instance.uid,
      'chatGroupId': instance.chatGroupId,
      'communityName': instance.communityName,
      'description': instance.description,
      'category': instance.category,
      'administrator': instance.administrator,
      'editors': instance.editors,
      'avatarUrls': instance.avatarUrls,
      'participants': instance.participants,
      'public': instance.public,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt,
    };
