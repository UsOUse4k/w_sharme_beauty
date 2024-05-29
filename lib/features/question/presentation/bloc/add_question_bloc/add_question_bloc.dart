import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';

import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart';

part 'add_question_bloc.freezed.dart';
part 'add_question_event.dart';
part 'add_question_state.dart';

@injectable
class AddQuestionBloc extends Bloc<AddQuestionEvent, AddQuestionState> {
  AddQuestionBloc(
    this._questionRepository,
    this._authFacade,
  ) : super(
          const AddQuestionState.initial(),
        ) {
    on<AddQuestionEvent>((event, emit) async {
      await event.maybeWhen(
        orElse: () => null,
        addedQuestion: (question, isAnonymous) async {
          emit(const AddQuestionState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(() {
            emit(
              const AddQuestionState.error(
                message: 'not user authentication',
              ),
            );
          }, (user) async {
            final username = await _authFacade.getMeInfo(user.uid);
            await username.fold((l) {
              emit(const AddQuestionState.error(message: 'not username'));
            }, (profile) async {
              final updateQuestion = question.copyWith(
                username: isAnonymous ? 'Анонимно' : profile.username,
                avatarUrl: isAnonymous ? null : profile.profilePictureUrl,
                questionId: const Uuid().v1(),
                createdAt: Timestamp.now(),
              );
              final result = await _questionRepository.addQuestion(
                question: updateQuestion,
                isAnonymous: isAnonymous,
              );
              result.fold((l) {
                emit(AddQuestionState.error(message: l.messasge));
              }, (data) {
                emit(AddQuestionState.success(data));
              });
            });
          });
        },
      );
    });
  }
  final IQuestionRepository _questionRepository;
  final IAuthFacade _authFacade;
}
