import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/entities.dart';

abstract class IQuestionRepository {
  Future<Either<PostError, List<Question>>> getAllQuestions({String? userId});

  Future<Either<PostError, Unit>> getQuestion({required String questionId});
}
