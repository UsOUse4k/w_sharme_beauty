import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart';

part 'comment_likes_event.dart';
part 'comment_likes_state.dart';
part 'comment_likes_bloc.freezed.dart';

@injectable
class CommentLikesBloc extends Bloc<CommentLikesEvent, CommentLikesState> {
  CommentLikesBloc(
    this._commentRepository,
  ) : super(const CommentLikesState.initial()) {
    on<_LikeComment>((event, emit) async {
      emit(const CommentLikesState.loading());
      try {
        if (event.subCommentId != null && event.subCommentId!.isNotEmpty) {
          await _commentRepository.updateLikes(
            postId: event.postId.toString(),
            commentId: event.commentId.toString(),
            isLike: event.isLiked,
            subCommentId: event.subCommentId,
          );
          emit(const CommentLikesState.success());
        } else {
          await _commentRepository.updateLikes(
            postId: event.postId.toString(),
            commentId: event.commentId.toString(),
            isLike: event.isLiked,
          );
          emit(const CommentLikesState.success());
        }
      } catch (e) {
        emit(const CommentLikesState.error());
      }
    });
  }
  final ICommentRepository _commentRepository;
}
