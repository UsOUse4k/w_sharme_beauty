import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';

abstract class IQuestionRepository {
  Future<Either<PostError, Question>> addQuestion({
    required Question question,
    required bool isAnonymous,
  });
  Future<Either<PostError, List<Question>>> getQuestions({String? userId});
  Future<Either<PostError, Question>> getQuestion({
    required String questionid,
  });
}
