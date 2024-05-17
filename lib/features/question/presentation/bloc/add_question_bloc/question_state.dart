part of 'question_bloc.dart';

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState.initial() = _Initial;
  const factory QuestionState.loading() = _LoadingQuestion;
  const factory QuestionState.success(Question question) = _SuccessQuestion;

  const factory QuestionState.error({required String message}) = _ErrorQuestion;
}
