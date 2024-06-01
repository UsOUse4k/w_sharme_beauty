part of 'question_get_all_reply_comment_bloc.dart';

@freezed
class QuestionGetAllReplyCommentState with _$QuestionGetAllReplyCommentState {
  const factory QuestionGetAllReplyCommentState.initial() = _Initial;
  const factory QuestionGetAllReplyCommentState.success(
      Map<String, List<Comment>> comments,) = _Success;
  const factory QuestionGetAllReplyCommentState.loading() = _Loading;
  const factory QuestionGetAllReplyCommentState.error({required String error}) =
      _Error;
}
