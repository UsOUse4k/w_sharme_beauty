// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      questionText: json['questionText'] as String?,
      category: json['category'] as String?,
      theme: json['theme'] as String?,
      uid: json['uid'] as String?,
      username: json['username'] as String?,
      questionId: json['questionId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'questionText': instance.questionText,
      'category': instance.category,
      'theme': instance.theme,
      'uid': instance.uid,
      'username': instance.username,
      'questionId': instance.questionId,
      'imageUrl': instance.imageUrl,
      'answers': instance.answers,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };