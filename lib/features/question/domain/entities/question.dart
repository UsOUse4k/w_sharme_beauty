import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  factory Question({
    String? questionText,
    String? category,
    String? theme,
    String? uid,
    String? username,
    String? questionId,
    String? avatarUrl,
    String? imageUrl,
    @Default([]) List<String> answers,
    @TimestampConverter() Timestamp? createdAt,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  factory Question.fromStoreData(Map<String, dynamic> firestoreData) {
    return Question(
      questionText: firestoreData['questionText'] as String?,
      category: firestoreData['category'] as String?,
      theme: firestoreData['theme'] as String?,
      uid: firestoreData['uid'] as String?,
      username: firestoreData['username'] as String?,
      questionId: firestoreData['questionId'] as String?,
      imageUrl: firestoreData['imageUrl'] as String?,
      avatarUrl: firestoreData['avatarUrl'] as String?,
      answers:
          List<String>.from(firestoreData['answers'] as List<dynamic>? ?? []),
      createdAt: firestoreData['createdAt'] as Timestamp?,
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
