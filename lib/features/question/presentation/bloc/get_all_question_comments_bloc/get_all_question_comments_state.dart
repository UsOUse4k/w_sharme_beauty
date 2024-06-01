part of 'get_all_question_comments_bloc.dart';

@freezed
class GetAllQuestionCommentsState with _$GetAllQuestionCommentsState {
  const factory GetAllQuestionCommentsState.initial() = _Initial;
  const factory GetAllQuestionCommentsState.success({required List<Comment> comments}) = _Success;
  const factory GetAllQuestionCommentsState.loading() = _Loading;
  const factory GetAllQuestionCommentsState.error({required String message}) = _Error;

}
