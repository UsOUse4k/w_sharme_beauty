import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default('') String? uid,
    @Default('') String? commentId,
    @Default('') String? comment,
    @Default('') String? username,
    @Default('') String? avatarUrl,
    @Default([]) List<String> likes,
    @TimestampConverter() DateTime? createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}

class TimestampConverter
    implements JsonConverter<DateTime?, Map<String, dynamic>?> {
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
    return dateTime != null
        ? {'seconds': dateTime.millisecondsSinceEpoch ~/ 1000}
        : null;
  }
}
