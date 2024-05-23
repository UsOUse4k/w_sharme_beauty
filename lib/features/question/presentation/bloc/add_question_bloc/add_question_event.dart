part of 'add_question_bloc.dart';

@freezed
class AddQuestionEvent with _$QuestionEvent {
  const factory AddQuestionEvent.addedQuestion({
    required Question question,
    required bool isAnonymous,
  }) = _AddedQuestionEvent;

  const factory AddQuestionEvent.getQuestions() = _GetQuestions;
}
