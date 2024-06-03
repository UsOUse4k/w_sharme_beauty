// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      profilePictureUrl: json['profilePictureUrl'] as String? ?? '',
      aboutYourself: json['aboutYourself'] as String? ?? '',
      category: (json['category'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      theme: json['theme'] as String? ?? '',
      city: json['city'] as String? ?? '',
      dateUser: json['dateUser'] as String? ?? '',
      phoneUser: json['phoneUser'] as String? ?? '',
      publics: json['publics'] as int? ?? 0,
      followers: (json['followers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subscriptions: (json['subscriptions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      rating: json['rating'] as String? ?? '10',
      stories: (json['stories'] as List<dynamic>?)
              ?.map((e) => Stories.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastSeen: const TimestampConverter().fromJson(json['lastSeen']),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'username': instance.username,
      'profilePictureUrl': instance.profilePictureUrl,
      'aboutYourself': instance.aboutYourself,
      'category': instance.category,
      'theme': instance.theme,
      'city': instance.city,
      'dateUser': instance.dateUser,
      'phoneUser': instance.phoneUser,
      'publics': instance.publics,
      'followers': instance.followers,
      'subscriptions': instance.subscriptions,
      'rating': instance.rating,
      'stories': instance.stories,
      'lastSeen': const TimestampConverter().toJson(instance.lastSeen),
    };
