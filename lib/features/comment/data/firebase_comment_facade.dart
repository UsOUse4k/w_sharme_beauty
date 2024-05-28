import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart';

@LazySingleton(as: ICommentRepository)
class FirebaseCommentFacade implements ICommentRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  FirebaseCommentFacade(this.firestore, this.auth);

  @override
  Future<Either<PostError, Comment>> createComment({
    required Comment comment,
    required String postId,
    String? parentCommentId,
  }) async {
    try {
      final updatedComment = comment.copyWith(
        uid: auth.currentUser!.uid,
      );
      if (parentCommentId != null && parentCommentId.isNotEmpty) {
        await firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(parentCommentId)
            .collection('replies')
            .doc(updatedComment.commentId)
            .set(updatedComment.toJson());
      } else {
        await firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(updatedComment.commentId)
            .set(updatedComment.toJson());
      }

      return right(updatedComment);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Unit>> updateCountsComment({
    required String postId,
    String? commentId,
  }) async {
    try {
      DocumentReference reference;
      reference = firestore.collection('posts').doc(postId);
      await reference.update({'commentsCount': FieldValue.increment(1)});
      if (commentId != null && commentId.isNotEmpty) {
        await reference
            .collection('comments')
            .doc(commentId)
            .update({'replies': FieldValue.increment(1)});
      }
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<Comment>>> getComments({
    required String postId,
    int limit = 10,
    DocumentSnapshot? lastDocSnapshot,
    String? parentCommentId,
  }) async {
    try {
      Query<Map<String, dynamic>> query;
      if (parentCommentId != null && parentCommentId.isNotEmpty) {
        query = firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(parentCommentId)
            .collection('replies');
      } else {
        query =
            firestore.collection('posts').doc(postId).collection('comments');
      }
      final querySnapshot = await query.get();
      final comments = querySnapshot.docs
          .map((doc) => Comment.fromJson(doc.data()))
          .toList();
      return right(comments);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Unit>> updateLikes({
    required String postId,
    required String commentId,
    String? subCommentId,
    required bool isLike,
  }) async {
    final userId = auth.currentUser!.uid;
    final DocumentReference reference = firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(commentId);
    try {
      if (subCommentId != null) {
        await reference.collection('reply_comments').doc(subCommentId).update(
          {
            'likes': isLike
                ? FieldValue.arrayRemove([userId])
                : FieldValue.arrayUnion([userId]),
          },
        );
      } else {
        await reference.update(
          {
            'likes': isLike
                ? FieldValue.arrayRemove([userId])
                : FieldValue.arrayUnion([userId]),
          },
        );
      }
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
