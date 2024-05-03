import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
  factory Community({
    String? communityId,
    String? uid,
    String? communityName,
    String? description,
    @Default("") String? avatarUrls,
    @Default([]) List<String>? participants,
    @Default(false) bool isFavorite,
    @Default("") String? createdAt,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
