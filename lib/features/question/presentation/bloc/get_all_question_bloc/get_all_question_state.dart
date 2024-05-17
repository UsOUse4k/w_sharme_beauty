part of 'get_all_question_bloc.dart';

@freezed
class GetAllQuestionState with _$GetAllQuestionState {
  const factory GetAllQuestionState.initial() = _Initial;
  const factory GetAllQuestionState.loading() = _Loading;
  const factory GetAllQuestionState.success(List<Question> questions) =
      _Success;
  const factory GetAllQuestionState.error({required String message}) = _Error;
}
