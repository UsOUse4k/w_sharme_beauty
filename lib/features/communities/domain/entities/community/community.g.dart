// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityImpl _$$CommunityImplFromJson(Map json) => _$CommunityImpl(
      communityId: json['communityId'] as String?,
      uid: json['uid'] as String?,
      chatGroupId: json['chatGroupId'] as String?,
      chatGroupName: json['chatGroupName'] as String?,
      communityName: json['communityName'] as String?,
      description: json['description'] as String?,
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      administrator: (json['administrator'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      editors: (json['editors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      avatarUrls: json['avatarUrls'] as String? ?? "",
      chatImageUrl: json['chatImageUrl'] as String? ?? "",
      participants: (json['participants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      public: (json['public'] as num?)?.toInt() ?? 0,
      isFavorite: json['isFavorite'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? "",
      lastMessageTs: const TimestampConverter().fromJson(json['lastMessageTs']),
      messageCount: (json['messageCount'] as num?)?.toInt() ?? 0,
      lastMessage: json['lastMessage'] as String? ?? "",
      lastSenderId: json['lastSenderId'] as String? ?? "",
      seen: json['seen'] as bool?,
    );

Map<String, dynamic> _$$CommunityImplToJson(_$CommunityImpl instance) =>
    <String, dynamic>{
      'communityId': instance.communityId,
      'uid': instance.uid,
      'chatGroupId': instance.chatGroupId,
      'chatGroupName': instance.chatGroupName,
      'communityName': instance.communityName,
      'description': instance.description,
      'category': instance.category,
      'administrator': instance.administrator,
      'editors': instance.editors,
      'avatarUrls': instance.avatarUrls,
      'chatImageUrl': instance.chatImageUrl,
      'participants': instance.participants,
      'public': instance.public,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt,
      'lastMessageTs':
          const TimestampConverter().toJson(instance.lastMessageTs),
      'messageCount': instance.messageCount,
      'lastMessage': instance.lastMessage,
      'lastSenderId': instance.lastSenderId,
      'seen': instance.seen,
    };
