import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/comment.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
  factory Community({
    required String id,
    required String name,
    required String description,
    String? videoUrl,
    @Default([]) List<String> imageUrls,
    @Default([]) List<String> likes,
    @Default([]) List<Comment> comments,
    @Default([]) List<String> reposts,
    @Default(false) bool isFavorite,
    @TimestampConverter() DateTime? createdAt,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
