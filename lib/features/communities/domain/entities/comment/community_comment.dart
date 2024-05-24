import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_comment.freezed.dart';
part 'community_comment.g.dart';

@freezed
class CommunityComment with _$CommunityComment {
  const factory CommunityComment({
    @Default('') String uid,
    @Default('') String? commentId,
    @Default('') String? comment,
    @Default('') String? username,
    @Default('') String? avatarUrl,
    @Default([]) List<String> likes,
    @Default(0) int replies,
    @Default('') String? parentCommentId,
    @TimestampConverter() Timestamp? createdAt,
  }) = _CommunityComment;

  factory CommunityComment.fromJson(Map<String, dynamic> json) =>
      _$CommunityCommentFromJson(json);

  factory CommunityComment.fromFirestore(DocumentSnapshot firestoreData) {
    return CommunityComment(
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
