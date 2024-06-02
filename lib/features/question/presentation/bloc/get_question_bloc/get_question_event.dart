part of 'get_question_bloc.dart';

@freezed
class GetQuestionEvent with _$GetQuestionEvent {
  const factory GetQuestionEvent.getQuestion({required String questionId}) = _GetQuestion;
}
