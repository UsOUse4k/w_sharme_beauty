part of 'add_question_bloc.dart';

@freezed
class AddQuestionState with _$QuestionState {
  const factory AddQuestionState.initial() = _Initial;
  const factory AddQuestionState.loading() = _LoadingQuestion;
  const factory AddQuestionState.success(Question question) = _SuccessQuestion;

  const factory AddQuestionState.error({required String message}) =
      _ErrorQuestion;
}
