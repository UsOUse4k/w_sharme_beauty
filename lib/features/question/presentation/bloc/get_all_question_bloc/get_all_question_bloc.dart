import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart';

part 'get_all_question_event.dart';
part 'get_all_question_state.dart';
part 'get_all_question_bloc.freezed.dart';

@injectable
class GetAllQuestionBloc
    extends Bloc<GetAllQuestionEvent, GetAllQuestionState> {
  GetAllQuestionBloc(this._questionRepository) : super(const _Initial()) {
    on<GetAllQuestionEvent>((event, emit) async {
      await event.map(
        getAllQuestions: (event) async {
          emit(const GetAllQuestionState.loading());
          final result = await _questionRepository.getAllQuestions();
          result.fold(
            (error) {
              emit(GetAllQuestionState.error(message: error.messasge));
            },
            (questions) {
              emit(GetAllQuestionState.success(questions));
            },
          );
        },
      );
    });
  }
  final IQuestionRepository _questionRepository;
}
