import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart';

part 'get_question_event.dart';
part 'get_question_state.dart';
part 'get_question_bloc.freezed.dart';

@injectable
class GetQuestionBloc extends Bloc<GetQuestionEvent, GetQuestionState> {
  GetQuestionBloc(this._questionRepository) : super(const _Initial()) {
    on<_GetQuestion>((event, emit) async {
      emit(const GetQuestionState.loading());
      try {
        final result =
            await _questionRepository.getQuestion(questionid: event.questionId);
        result.fold(
          (error) => emit(GetQuestionState.error(message: error.messasge)),
          (data) => emit(GetQuestionState.success(question: data)),
        );
      } catch (e) {
        emit(GetQuestionState.error(message: e.toString()));
      }
    });
  }
  final IQuestionRepository _questionRepository;
}
