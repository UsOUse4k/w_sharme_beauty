// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart';

part 'create_question_comment_event.dart';
part 'create_question_comment_state.dart';
part 'create_question_comment_bloc.freezed.dart';

@injectable
class CreateQuestionCommentBloc
    extends Bloc<CreateQuestionCommentEvent, CreateQuestionCommentState> {
  CreateQuestionCommentBloc(this._commentRepository, this._authFacade)
      : super(const _Initial()) {
    on<_CreateComment>((event, emit) async {
      emit(const CreateQuestionCommentState.loading());
      try {
        final userOption = await _authFacade.getSignedInUser();
        await userOption.fold(() async {
          emit(
            const CreateQuestionCommentState.error(
              error: 'not user sign in',
            ),
          );
        }, (user) async {
          final userData = await _authFacade.getMeInfo(user.uid);
          await userData.fold((l) async {
            emit(CreateQuestionCommentState.error(error: l.messasge));
          }, (userData) async {
            final updateAvatar =
                event.authorId == user.uid && event.avatarUrl == 'null'
                    ? null
                    : userData.profilePictureUrl;
            final updateUsername =
                event.authorId == user.uid && event.avatarUrl == 'null'
                    ? 'Анонимно'
                    : userData.username;
            final updateComment = event.comment.copyWith(
              avatarUrl: updateAvatar,
              username: updateUsername,
            );
            final result = await _commentRepository.createCommemt(
              comment: updateComment,
              questionId: event.questionId,
            );
            result.fold(
              (l) => emit(CreateQuestionCommentState.error(error: l.messasge)),
              (data) => emit(CreateQuestionCommentState.success(data)),
            );
          });
        });
      } catch (e) {
        emit(CreateQuestionCommentState.error(error: e.toString()));
      }
    });
  }
  final IQuestionCommentRepository _commentRepository;
  final IAuthFacade _authFacade;
}
