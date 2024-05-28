import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart';

part 'comment_create_event.dart';
part 'comment_create_state.dart';
part 'comment_create_bloc.freezed.dart';

@injectable
class CommentCreateBloc extends Bloc<CommentCreateEvent, CommentCreateState> {
  CommentCreateBloc(
    this._repository,
    this._authFacade,
  ) : super(const _Initial()) {
    on<CommentCreateEvent>((event, emit) async {
      await event.maybeMap(
        addComment: (event) async {
          emit(const CommentCreateState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(
            () {
              emit(const CommentCreateState.error());
            },
            (user) async {
              final userData = await _authFacade.getMeInfo(user.uid);
              await userData.fold((l) async {
                emit(const CommentCreateState.error());
              }, (data) async {
                final newCommentId = const Uuid().v1();
                final updateComment = Comment(
                  commentId: newCommentId,
                  username: data.username,
                  avatarUrl: data.profilePictureUrl,
                  comment: event.comment.comment,
                  createdAt: Timestamp.now(),
                );
                final result = await _repository.createComment(
                  comment: updateComment,
                  postId: event.postId,
                );
                result.fold(
                  (l) => {
                    emit(const CommentCreateState.error()),
                  },
                  (comment) async {
                    emit(CommentCreateState.success(comment));
                    await _repository.updateCountsComment(postId: event.postId);
                  },
                );
              });
            },
          );
        },
        orElse: () {},
      );
    });
  }

  final ICommentRepository _repository;
  final IAuthFacade _authFacade;
}
