part of 'create_question_reply_comment_bloc.dart';

@freezed
class CreateQuestionReplyCommentState with _$CreateQuestionReplyCommentState {
  const factory CreateQuestionReplyCommentState.initial() = _Initial;
  const factory CreateQuestionReplyCommentState.loading() = _Loading;
  const factory CreateQuestionReplyCommentState.error({required String message}) = _Error;
  const factory CreateQuestionReplyCommentState.success(Comment comment) = _Success;

}
