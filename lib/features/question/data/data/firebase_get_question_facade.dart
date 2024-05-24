import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart';

@LazySingleton(as: IQuestionRepository)
class FirestoreAddQuestionRepository implements IQuestionRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  FirestoreAddQuestionRepository({required this.firestore, required this.auth});

  @override
  Future<Either<PostError, Unit>> getQuestion({required String questionId}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<PostError, List<Question>>> getAllQuestions({
    String? userId,
  }) async {
    try {
      final QuerySnapshot querySnapshot;
      if (userId != null) {
        querySnapshot = await firestore
            .collection('questions')
            .where('uid', isEqualTo: userId)
            .orderBy('createdAt', descending: true)
            .get();
      } else {
        querySnapshot = await firestore.collection('questions').get();
      }
      final List<Question> questions = querySnapshot.docs
          .map(
            (e) => Question.fromJson(e.data()! as Map<String, dynamic>),
          )
          .toList();
      return right(questions);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
