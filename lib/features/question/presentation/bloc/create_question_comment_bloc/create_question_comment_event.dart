part of 'create_question_comment_bloc.dart';

@freezed
class CreateQuestionCommentEvent with _$CreateQuestionCommentEvent {
  const factory CreateQuestionCommentEvent.createComment({
    required String questionId,
    required Comment comment,
    required String avatarUrl,
    required String authorId,
  }) = _CreateComment;
}
