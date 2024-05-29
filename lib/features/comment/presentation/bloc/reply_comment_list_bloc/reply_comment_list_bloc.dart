import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart';

part 'reply_comment_list_event.dart';
part 'reply_comment_list_state.dart';
part 'reply_comment_list_bloc.freezed.dart';

@injectable
class ReplyCommentListBloc
    extends Bloc<ReplyCommentListEvent, ReplyCommentListState> {
  ReplyCommentListBloc(this._commentRepository) : super(const _Initial()) {
    on<_GetReplyComments>((event, emit) async {
      emit(const ReplyCommentListState.loading());
      try {
        final result = await _commentRepository.getComments(
          postId: event.postId,
          parentCommentId: event.parentCommentId,
        );
        result.fold(
            (error) => emit(ReplyCommentListState.error(error: error.messasge)),
            (comments) {
          final currentReplies = state.maybeMap(
            success: (s) => Map<String, List<Comment>>.from(s.comments),
            orElse: () => <String, List<Comment>>{},
          );
          currentReplies[event.parentCommentId] = comments;
          emit(ReplyCommentListState.success(currentReplies));
        });
      } catch (e) {
        emit(ReplyCommentListState.error(error: e.toString()));
      }
    });

    on<_AddNewComments>((event, emit) {
      state.maybeWhen(
        success: (commentsMap) {
          final parentId = event.comment.parentCommentId;
          if (parentId != null) {
            final List<Comment> updatedComments =
                List.from(commentsMap[parentId] ?? []);
            updatedComments.add(event.comment);
            commentsMap[parentId] = updatedComments;
            emit(ReplyCommentListState.success(commentsMap));
          }
        },
        orElse: () {},
      );
    });
  }

  final ICommentRepository _commentRepository;
}
