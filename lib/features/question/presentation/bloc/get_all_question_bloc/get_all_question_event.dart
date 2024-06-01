part of 'get_all_question_bloc.dart';

@freezed
class GetAllQuestionEvent with _$GetAllQuestionEvent {
  const factory GetAllQuestionEvent.getAllQuestions() = _GetAllQuestions;
  const factory GetAllQuestionEvent.addNewQuestion({
    required Question question,
  }) = _AddNewQuestion;
  const factory GetAllQuestionEvent.searchQuestion({required String value}) =
      _SearchQuestion;
  const factory GetAllQuestionEvent.filterQuestion({required String title}) =
      _FilterQuestion;
  const factory GetAllQuestionEvent.myQuestions() =
      _MyQuestions;
  const factory GetAllQuestionEvent.myAnswers() =
      _MyAnswers;
}
