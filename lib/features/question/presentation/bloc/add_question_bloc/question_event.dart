part of 'question_bloc.dart';

@freezed
class QuestionEvent with _$QuestionEvent {
  const factory QuestionEvent.addedQuestion({
    required Question question,
    required bool isAnonymous,
  }) = _AddedQuestionEvent;

  const factory QuestionEvent.getQuestions() = _GetQuestions;
}
