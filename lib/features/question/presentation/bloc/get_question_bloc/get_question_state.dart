part of 'get_question_bloc.dart';

@freezed
class GetQuestionState with _$GetQuestionState {
  const factory GetQuestionState.initial() = _Initial;
  const factory GetQuestionState.success({required Question question}) = _Success;
  const factory GetQuestionState.error({required String message}) = _Error;
  const factory GetQuestionState.loading() = _Loading;
}
