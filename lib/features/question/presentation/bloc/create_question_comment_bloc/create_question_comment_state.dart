part of 'create_question_comment_bloc.dart';

@freezed
class CreateQuestionCommentState with _$CreateQuestionCommentState {
  const factory CreateQuestionCommentState.initial() = _Initial;
  const factory CreateQuestionCommentState.success(Comment comment) = _Success;
  const factory CreateQuestionCommentState.error({required String error}) = _Error;
  const factory CreateQuestionCommentState.loading() = _Loading;

}
