part of 'question_get_all_reply_comment_bloc.dart';

@freezed
class QuestionGetAllReplyCommentEvent with _$QuestionGetAllReplyCommentEvent {
  const factory QuestionGetAllReplyCommentEvent.getReplyComments({
    required String questionId,
    required String parentCommentId,
  }) = _GetReplyComments;
  const factory QuestionGetAllReplyCommentEvent.addNewComments(
    Comment comment,
  ) = _AddNewComments;
}
