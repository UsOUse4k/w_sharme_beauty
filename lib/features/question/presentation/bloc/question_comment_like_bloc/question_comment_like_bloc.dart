import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart';

part 'question_comment_like_event.dart';
part 'question_comment_like_state.dart';
part 'question_comment_like_bloc.freezed.dart';

@injectable
class QuestionCommentLikeBloc
    extends Bloc<QuestionCommentLikeEvent, QuestionCommentLikeState> {
  QuestionCommentLikeBloc(this._commentRepository) : super(const _Initial()) {
    on<_LikeComment>((event, emit) async {
      emit(const QuestionCommentLikeState.loading());
      try {
        if (event.subCommentId != null && event.subCommentId!.isNotEmpty) {
          await _commentRepository.updateLike(
            questionId: event.questionId.toString(),
            commentId: event.commentId.toString(),
            isLike: event.isLiked,
            subCommentId: event.subCommentId,
          );
          emit(const QuestionCommentLikeState.success());
        } else {
          await _commentRepository.updateLike(
            questionId: event.questionId.toString(),
            commentId: event.commentId.toString(),
            isLike: event.isLiked,
          );
          emit(const QuestionCommentLikeState.success());
        }
      } catch (e) {
        emit(const QuestionCommentLikeState.error());
      }
    });
  }
  final IQuestionCommentRepository _commentRepository;
}
