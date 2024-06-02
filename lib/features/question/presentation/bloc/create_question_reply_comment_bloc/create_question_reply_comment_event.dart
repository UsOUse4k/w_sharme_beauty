part of 'create_question_reply_comment_bloc.dart';

@freezed
class CreateQuestionReplyCommentEvent with _$CreateQuestionReplyCommentEvent {
  const factory CreateQuestionReplyCommentEvent.createReplyComment({
    required String questionId,
    required Comment comment,
    required String parentCommentId,
    required String avatarUrl,
    required String authorId,
  }) = _CreateReplyComment;
}
