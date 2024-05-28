import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

abstract class ICommentRepository {
  Future<Either<PostError, Comment>> createComment({
    required Comment comment,
    required String postId,
    String? parentCommentId,
  });
  Future<Either<PostError, List<Comment>>> getComments({
    required String postId,
    int limit,
    DocumentSnapshot? lastDocSnapshot,
    String? parentCommentId,
  });
  Future<Either<PostError, Unit>> updateLikes({
    required String postId,
    required String commentId,
    String? subCommentId,
    required bool isLike,
  });
  Future<Either<PostError, Unit>> updateCountsComment({
    required String postId,
    String? commentId,
  });
}
