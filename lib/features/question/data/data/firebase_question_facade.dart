import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/i_question_repository.dart';

@LazySingleton(as: IQuestionRepository)
class FirebaseQuestionFacade implements IQuestionRepository {
  final FirebaseFirestore _firestore;
  FirebaseQuestionFacade(this._firestore);
  @override
  Future<Either<PostError, Question>> addQuestion({
    required Question question,
    required bool isAnonymous,
    Uint8List? image,
  }) async {
    try {
      final updateQuestion = question.copyWith(
        uid: firebaseAuth.currentUser!.uid,
      );
      await _firestore
          .collection('questions')
          .doc(question.questionId)
          .set(updateQuestion.toJson());
      return right(updateQuestion);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<Question>>> getQuestions({
    String? userId,
  }) async {
    try {
      final result = await _firestore
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

  @override
  Future<Either<PostError, Question>> getQuestion({
    required String questionid,
  }) async {
    try {
      final DocumentSnapshot questionSnapshot =
          await _firestore.collection('questions').doc(questionid).get();
      if (!questionSnapshot.exists) {
        return left(PostError('Question not found.'));
      }
      final Question questionData = Question.fromStoreData(
        questionSnapshot.data()! as Map<String, dynamic>,
      );
      return right(questionData);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
