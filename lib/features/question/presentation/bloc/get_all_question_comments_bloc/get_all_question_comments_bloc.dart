import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart';

part 'get_all_question_comments_event.dart';
part 'get_all_question_comments_state.dart';
part 'get_all_question_comments_bloc.freezed.dart';

@injectable
class GetAllQuestionCommentsBloc
    extends Bloc<GetAllQuestionCommentsEvent, GetAllQuestionCommentsState> {
  GetAllQuestionCommentsBloc(this._commentRepository)
      : super(const _Initial()) {
    on<_GetAllComments>((event, emit) async {
      emit(const GetAllQuestionCommentsState.loading());
      try {
        final result = await _commentRepository.getAllQuestionComments(
            questionId: event.questionId,);
        result.fold(
          (l) => emit(GetAllQuestionCommentsState.error(message: l.messasge)),
          (comments) => emit(
            GetAllQuestionCommentsState.success(comments: comments),
          ),
        );
      } catch (e) {
        emit(GetAllQuestionCommentsState.error(message: e.toString()));
      }
    });
    on<_AddNewComments>(
      (event, emit) {
        state.maybeWhen(
          success: (comments) {
            final data = [event.comment, ...comments];
            emit(GetAllQuestionCommentsState.success(comments: data));
          },
          orElse: () {},
        );
      },
    );
  }
  final IQuestionCommentRepository _commentRepository;
}
