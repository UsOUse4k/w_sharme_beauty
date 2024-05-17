import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart';

import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart';

part 'question_bloc.freezed.dart';
part 'question_event.dart';
part 'question_state.dart';

@injectable
class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  QuestionBloc(
    this._questionRepository,
    this._profileInfoRepository,
    this._authFacade,
  ) : super(
          const QuestionState.initial(),
        ) {
    on<QuestionEvent>((event, emit) async {
      await event.maybeWhen(
        orElse: () => null,
        addedQuestion: (question, isAnonymous) async {
          emit(const QuestionState.loading());
          final userOption = await _authFacade.getSignedInUser();
          await userOption.fold(() {
            emit(const QuestionState.error(message: 'not user authentication'));
          }, (user) async {
            final username = await _profileInfoRepository.getMeInfo(user.uid);
            await username.fold((l) {
              emit(const QuestionState.error(message: 'not username'));
            }, (profile) async {
              final updateQuestion = question.copyWith(
                username: isAnonymous ? 'anonymous' : profile.username,
                uid: isAnonymous ? '' : user.uid,
                questionId: const Uuid().v1(),
                createdAt: Timestamp.now(),
              );
              final result = await _questionRepository.addQuestion(
                question: updateQuestion,
                isAnonymous: isAnonymous,
              );
              result.fold((l) {
                emit(QuestionState.error(message: l.messasge));
              }, (r) {
                emit(QuestionState.success(question));
              });
            });
          });
        },
      );
    });
  }
  final AddQuestionRepository _questionRepository;
  final IProfileInfoRepository _profileInfoRepository;
  final IAuthFacade _authFacade;
}
