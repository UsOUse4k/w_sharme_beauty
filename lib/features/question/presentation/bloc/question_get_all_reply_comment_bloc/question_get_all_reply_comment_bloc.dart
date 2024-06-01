import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart';

part 'question_get_all_reply_comment_event.dart';
part 'question_get_all_reply_comment_state.dart';
part 'question_get_all_reply_comment_bloc.freezed.dart';

@injectable
class QuestionGetAllReplyCommentBloc extends Bloc<
    QuestionGetAllReplyCommentEvent, QuestionGetAllReplyCommentState> {
  QuestionGetAllReplyCommentBloc(this._commentRepository)
      : super(const _Initial()) {
    on<_GetReplyComments>((event, emit) async {
      try {
        final result = await _commentRepository.getAllQuestionComments(
          questionId: event.questionId,
          parentCommentId: event.parentCommentId,
        );
        await result.fold((error) async {
          emit(
            QuestionGetAllReplyCommentState.error(error: error.messasge),
          );
        }, (comments) async {
          final currentReplies = state.maybeMap(
            success: (s) => Map<String, List<Comment>>.from(s.comments),
            orElse: () => <String, List<Comment>>{},
          );
          currentReplies[event.parentCommentId] = comments;
          emit(QuestionGetAllReplyCommentState.success(currentReplies));
        });
      } catch (e) {
        emit(QuestionGetAllReplyCommentState.error(error: e.toString()));
      }
    });
    on<_AddNewComments>((event, emit) {
      state.maybeWhen(
        success: (commentsMap) {
          final Map<String, List<Comment>> modifiableCommentsMap =
              Map.of(commentsMap);
          final parentId = event.comment.parentCommentId;
          if (parentId != null) {
            final List<Comment> updatedComments =
                List.from(modifiableCommentsMap[parentId] ?? []);
            updatedComments.add(event.comment);
            modifiableCommentsMap[parentId] = updatedComments;
            emit(
              QuestionGetAllReplyCommentState.success(modifiableCommentsMap),
            );
          }
        },
        orElse: () {},
      );
    });
  }
  final IQuestionCommentRepository _commentRepository;
}
