import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
  factory Community({
    String? communityId,
    String? uid,
    String? chatGroupId,
    String? chatGroupName,
    String? communityName,
    String? description,
    @Default([]) List<String>? category,
    @Default([]) List<String>? administrator,
    @Default([]) List<String>? editors,
    @Default("") String? avatarUrls,
    @Default("") String? chatImageUrl,
    @Default([]) List<String>? participants,
    @Default(0) int? public,
    @Default(false) bool isFavorite,
    @Default("") String? createdAt,
    @TimestampConverter() Timestamp? lastMessageTs,
    @Default(0) int? messageCount,
    @Default("") String? lastMessage,
    @Default("") String? lastSenderId,
    bool? seen,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
  factory Community.fromStoreData(Map<String, dynamic> firestoreData) {
    return Community(
      communityId: firestoreData['communityId'] as String?,
      uid: firestoreData['uid'] as String?,
      avatarUrls: firestoreData['avatarUrls'] as String?,
      communityName: firestoreData['communityName'] as String?,
      description: firestoreData['description'] as String?,
      category: List<String>.from(
        firestoreData['category'] as List<dynamic>? ?? [],
      ),
      participants: List<String>.from(
        firestoreData['participants'] as List<dynamic>? ?? [],
      ),
      editors: List<String>.from(
        firestoreData['editors'] as List<dynamic>? ?? [],
      ),
      administrator: List<String>.from(
        firestoreData['administrator'] as List<dynamic>? ?? [],
      ),
      isFavorite: firestoreData['isFavorite'] as bool? ?? false,
      createdAt: firestoreData['createdAt'] as String?,
      chatGroupId: firestoreData['chatGroupId'] as String?,
      messageCount: firestoreData['messageCount'] as int?,
      lastMessage: firestoreData['lastMessage'] as String?,
      chatGroupName: firestoreData['chatGroupName'] as String?,
      chatImageUrl: firestoreData['chatImageUrl'] as String?,
      public: firestoreData['public'] as int?,
      seen: firestoreData['seen'] as bool?,
      lastMessageTs: firestoreData['lastMessageTs'] as Timestamp?,
      lastSenderId: firestoreData['lastSenderId'] as String?,
    );
  }
}
