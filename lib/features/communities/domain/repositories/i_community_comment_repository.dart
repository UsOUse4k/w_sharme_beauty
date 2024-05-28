import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';

abstract class ICommunityCommentRepository {
  Future<Either<PostError, Comment>> createComment({
    required Comment comment,
    required String postId,
    String? parentCommentId,
    String? communityId,
  });
  Future<Either<PostError, List<Comment>>> getComments({
    required String postId,
    int limit,
    DocumentSnapshot? lastDocSnapshot,
    String? parentCommentId,
    String? communityId,
  });
  Future<Either<PostError, Comment>> getComment({
    required String postId,
    required String commentId,
    required String communityId,
  });
  Future<Either<PostError, Unit>> updateLikes({
    required String postId,
    required String commentId,
    String? subCommentId,
    required bool isLike,
    required String communityId,

  });
  Future<Either<PostError, Unit>> updateCountsComment({
    required String postId,
    String? commentId,
    required String communityId,
  });
}
