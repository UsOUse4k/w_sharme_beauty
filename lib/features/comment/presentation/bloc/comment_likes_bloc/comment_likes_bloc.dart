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
    on<CommentLikesEvent>((event, emit) async {
      await event.maybeWhen(
        likeComment: (commentId, subCommentId, postId, isLiked) async {
          emit(const CommentLikesState.loading());
          try {
            if (subCommentId != null && subCommentId.isNotEmpty) {
              await _commentRepository.updateLikes(
                  postId: postId.toString(),
                  commentId: commentId.toString(),
                  isLike: isLiked,
                  subCommentId: subCommentId);
              emit(const CommentLikesState.success());
            } else {
              await _commentRepository.updateLikes(
                postId: postId.toString(),
                commentId: commentId.toString(),
                isLike: isLiked,
              );
              emit(const CommentLikesState.success());
            }
          } catch (e) {
            emit(const CommentLikesState.error());
          }
        },
        orElse: () {},
      );
    });
  }
  final ICommentRepository _commentRepository;
}
