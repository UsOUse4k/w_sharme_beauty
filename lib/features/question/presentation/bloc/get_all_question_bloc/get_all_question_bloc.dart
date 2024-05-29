import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart';

part 'get_all_question_event.dart';
part 'get_all_question_state.dart';
part 'get_all_question_bloc.freezed.dart';

@injectable
class GetAllQuestionBloc
    extends Bloc<GetAllQuestionEvent, GetAllQuestionState> {
  List<Question>? allQuestions;
  GetAllQuestionBloc(this._iQuestionRepository) : super(const _Initial()) {
    on<GetAllQuestionEvent>((event, emit) async {
      await event.map(
        getAllQuestions: (event) async {
          emit(const GetAllQuestionState.loading());
          final result = await _iQuestionRepository.getQuestions();
          result.fold(
            (error) {
              emit(GetAllQuestionState.error(message: error.messasge));
            },
            (questions) {
              allQuestions = questions;
              emit(GetAllQuestionState.success(questions));
            },
          );
        },
        addNewQuestion: (value) {
          state.maybeWhen(
            success: (questions) {
              final data = [value.question, ...questions];
              emit(GetAllQuestionState.success(data));
            },
            orElse: () {},
          );
        },
        searchQuestion: (value) {
          state.maybeWhen(
            success: (questions) {
              if (allQuestions != null) {
                if (value.value.isEmpty) {
                  emit(GetAllQuestionState.success(allQuestions!));
                } else {
                  final updateQiestion = allQuestions!
                      .where(
                        (element) =>
                            element.questionText!.contains(value.value),
                      )
                      .toList();
                  emit(GetAllQuestionState.success(updateQiestion));
                }
              }
            },
            orElse: () {},
          );
        },
        filterQuestion: (e) {
          state.maybeWhen(
            success: (questions) {
              if (allQuestions != null) {
                final updateQiestion = allQuestions!
                    .where(
                      (element) => element.category!.contains(e.title),
                    )
                    .toList();
                emit(GetAllQuestionState.success(updateQiestion));
              }
            },
            orElse: () {},
          );
        },
      );
    });
  }
  final IQuestionRepository _iQuestionRepository;
}
