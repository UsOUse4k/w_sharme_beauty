import 'package:freezed_annotation/freezed_annotation.dart';

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
    String? category,
    @Default([]) List<String>? administrator,
    @Default([]) List<String>? editors,
    @Default("") String? avatarUrls,
    @Default([]) List<String>? participants,
    @Default(0) int? public,
    @Default(false) bool isFavorite,
    @Default("") String? createdAt,
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
      category: firestoreData['category'] as String?,
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
      chatGroupName: firestoreData['chatGroupName'] as String?,
      public: firestoreData['public'] as int?,
    );
  }
}
