import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';

abstract class AddQuestionRepository {
  Future<Either<PostError, Unit>> addQuestion({
    required Question question,
    required bool isAnonymous,
  });
  Future<Either<PostError, List<Question>>> getQuestions({String? userId});
}
