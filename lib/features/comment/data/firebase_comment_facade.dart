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
  Future<Either<PostError, Unit>> createComment({
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
            .collection('reply_comments')
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
            .collection('reply_comments');
      } else {
        query =
            firestore.collection('posts').doc(postId).collection('comments');
      }
      if (lastDocSnapshot != null) {
        query = query.startAfterDocument(lastDocSnapshot);
      }
      query = query.limit(limit);
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
    DocumentReference reference;
    try {
      if (subCommentId != null) {
        reference = firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .collection('reply_comments')
            .doc(subCommentId);
      } else {
        reference = firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId);
      }

      await reference.update(
        {
          'likes': isLike
              ? FieldValue.arrayRemove([userId])
              : FieldValue.arrayUnion([userId]),
        },
      );
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
