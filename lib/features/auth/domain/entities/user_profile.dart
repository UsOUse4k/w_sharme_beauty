import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

import 'package:w_sharme_beauty/features/profile/domain/entities/stories.dart';
part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? uid,
    String? email,
    @Default('') String? name,
    @Default('') String? username,
    @Default('') String? profilePictureUrl,
    @Default('') String? aboutYourself,
    @Default('') String? category,
    @Default('') String? theme,
    @Default('') String? city,
    @Default('') String? date,
    @Default(0) int? publics,
    @Default([]) List<String>? followers,
    @Default([]) List<String>? subscriptions,
    @Default('10') String? rating,
    @Default([]) List<Stories>? stories,
    @TimestampConverter() Timestamp? lastSeen,
    //
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.fromFirestore(Map<String, dynamic> firestoreData) {
    final uid = firestoreData['uid'] as String?;
    if (uid == null || uid.isEmpty) {
      return UserProfile(
        uid: '',
        email: firestoreData['email'] as String?,
        name: firestoreData['name'] as String? ?? '',
        username: firestoreData['username'] as String? ?? '',
        profilePictureUrl: firestoreData['profilePictureUrl'] as String? ?? '',
        aboutYourself: firestoreData['aboutYourself'] as String? ?? '',
        category: firestoreData['category'] as String? ?? '',
        theme: firestoreData['theme'] as String? ?? '',
        city: firestoreData['city'] as String? ?? '',
        date: firestoreData['date'] as String? ?? '',
        rating: firestoreData['rating'] as String? ?? '10',
        publics: firestoreData['publics'] as int? ?? 0,
        lastSeen: firestoreData['lastSeen'] as Timestamp?,
        followers: List<String>.from(
          firestoreData['followers'] as List<dynamic>? ?? [],
        ),
        subscriptions: List<String>.from(
          firestoreData['subscriptions'] as List<dynamic>? ?? [],
        ),
      );
    }

    return UserProfile(
      uid: uid,
      email: firestoreData['email'] as String?,
      name: firestoreData['name'] as String? ?? '',
      username: firestoreData['username'] as String? ?? '',
      profilePictureUrl: firestoreData['profilePictureUrl'] as String? ?? '',
      aboutYourself: firestoreData['aboutYourself'] as String? ?? '',
      category: firestoreData['category'] as String? ?? '',
      theme: firestoreData['theme'] as String? ?? '',
      city: firestoreData['city'] as String? ?? '',
      date: firestoreData['date'] as String? ?? '',
      rating: firestoreData['rating'] as String? ?? '10',
      publics: firestoreData['publics'] as int? ?? 0,
      lastSeen: firestoreData['lastSeen'] as Timestamp?,
      followers:
          List<String>.from(firestoreData['followers'] as List<dynamic>? ?? []),
      subscriptions: List<String>.from(
        firestoreData['subscriptions'] as List<dynamic>? ?? [],
      ),
    );
  }
}
