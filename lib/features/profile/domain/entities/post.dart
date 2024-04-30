import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/profile/domain/entities/comment.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    String? uid,
    String? postId,
    required String text,
    String? imageUrl,
    String? videoUrl,
    @Default(0) int likes,
    @Default([]) List<Comment> comments,
    @Default(0) int reposts,
    @Default(false) bool isFavorite,
    @TimestampConverter() DateTime? createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime?, Map<String, dynamic>?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Map<String, dynamic>? json) {
    if (json == null || json['seconds'] == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch((json['seconds'] as int) * 1000);
  }

  @override
  Map<String, dynamic>? toJson(DateTime? dateTime) {
    return dateTime != null ? {'seconds': dateTime.millisecondsSinceEpoch ~/ 1000} : null;
  }
}