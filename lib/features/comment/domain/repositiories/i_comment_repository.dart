import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

abstract class ICommentRepository {
  Future<Either<PostError, Unit>> createComment(
    String? userId,
    String? username,
    Comment? comment,
    String? avatarUrl,
    String? postId,
  );
}
