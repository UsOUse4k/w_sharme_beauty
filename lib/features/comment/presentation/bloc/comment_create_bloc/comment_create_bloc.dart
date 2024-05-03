import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart';


part 'comment_create_event.dart';
part 'comment_create_state.dart';
part 'comment_create_bloc.freezed.dart';

@injectable
class CommentCreateBloc extends Bloc<CommentCreateEvent, CommentCreateState> {
  CommentCreateBloc(this._repository, this._authFacade)
      : super(const _Initial()) {
    on<CommentCreateEvent>((event, emit) async {
      await event.maybeMap(
        addComment: (event) async {
          emit(const CommentCreateState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(() {}, (user) async {
            final result = await _repository.createComment(
              user.uid,
              user.username,
              event.comment,
              user.profilePictureUrl,
              event.postId
            );
            result.fold(
              (l) => {
                emit(const CommentCreateState.error()),
              },
              (comment) => {
                emit(CommentCreateState.success(event.comment)),
              },
            );
          });
        },
        orElse: () {},
      );
    });
  }

  final ICommentRepository _repository;
  final IAuthFacade _authFacade;
}
