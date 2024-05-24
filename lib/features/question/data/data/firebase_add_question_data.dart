import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/add_question_repository.dart';

@LazySingleton(as: AddQuestionRepository)
class FirestoreAddQuestionRepository implements AddQuestionRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final IAuthFacade profileInfoRepository;
  FirestoreAddQuestionRepository(
    this.profileInfoRepository, {
    required this.firestore,
    required this.auth,
  });
  @override
  Future<Either<PostError, Unit>> addQuestion({
    required Question question,
    required bool isAnonymous,
  }) async {
    try {
      Question quest = question;

      final res = await profileInfoRepository.getMeInfo(auth.currentUser!.uid);
      res.fold((l) {
        return left(PostError(l.messasge));
      }, (profile) {
        quest = quest.copyWith(
          username: isAnonymous ? 'Анонимный' : quest.username,
          imageUrl: isAnonymous ? null : profile.profilePictureUrl,
          uid: isAnonymous ? '' : auth.currentUser!.uid,
        );
      });
      await firestore.collection('questions').add(question.toJson());
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<Question>>> getQuestions({
    String? userId,
  }) async {
    try {
      final result = await firestore
          .collection('questions')
          .orderBy('createdAt', descending: true)
          .get();
      final question =
          result.docs.map((e) => Question.fromJson(e.data())).toList();
      return right(question);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
