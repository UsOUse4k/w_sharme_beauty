import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default('') String uid,
    @Default('') String? commentId,
    @Default('') String? comment,
    @Default('') String? username,
    @Default('') String? avatarUrl,
    @Default([]) List<String> likes,
    @Default(0) int replies,
    @Default('') String? parentCommentId,
    @TimestampConverter() Timestamp? createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  factory Comment.fromStoreData(Map<String, dynamic> firestoreData) {
    return Comment(
      commentId: firestoreData['commentId'] as String? ?? '',
      uid: firestoreData['uid'] as String? ?? '',
      comment: firestoreData['comment'] as String? ?? '',
      username: firestoreData['username'] as String? ?? '',
      avatarUrl: firestoreData['avatarUrl'] as String? ?? '',
      createdAt: firestoreData['createdAt'] as Timestamp?,
      likes: List<String>.from(firestoreData['likes'] as List<dynamic>? ?? []),
      replies: firestoreData['replies'] as int,
    );
  }
}

class TimestampConverter implements JsonConverter<Timestamp?, dynamic> {
  const TimestampConverter();

  @override
  Timestamp? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return json is Timestamp ? json : null;
  }

  @override
  dynamic toJson(Timestamp? timestamp) {
    return timestamp;
  }
}
