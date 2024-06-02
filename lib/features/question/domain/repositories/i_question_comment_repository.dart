import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

abstract class IQuestionCommentRepository {
  Future<Either<PostError, Comment>> createCommemt({
    required Comment comment,
    required String questionId,
    String? parentCommentId,
  });

  Future<Either<PostError, List<Comment>>> getAllQuestionComments({
    String? userId,
    String? parentCommentId,
    required String questionId,
  });
  Future<Either<PostError, Unit>> updateLike({
    required String questionId,
    String? subCommentId,
    required String commentId,
    required bool isLike,
  });
}
