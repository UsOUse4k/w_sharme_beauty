import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/question/domain/repositories/repositories.dart';

@LazySingleton(as: IQuestionCommentRepository)
class FirebaseQuestionCommentFacade implements IQuestionCommentRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  FirebaseQuestionCommentFacade(this._auth, this._firestore);
  @override
  Future<Either<PostError, Comment>> createCommemt({
    required Comment comment,
    required String questionId,
    String? parentCommentId,
  }) async {
    try {
      final currentUid = _auth.currentUser!.uid;
      final commentId = const Uuid().v1();
      final createdAd = Timestamp.now();
      final updatecomment = comment.copyWith(
        uid: currentUid,
        commentId: commentId,
        createdAt: createdAd,
      );
      final reference = _firestore
          .collection('questions')
          .doc(questionId)
          .collection('comments');
      _firestore.collection('questions').doc(questionId).update({
        'countOutput': FieldValue.increment(1),
      });
      await _firestore.runTransaction((transaction) async {
        final snapshot = await transaction
            .get(_firestore.collection('questions').doc(questionId));
        final docData = snapshot.data();
        final answers =
            List<String>.from(docData?['answers'] as List<dynamic>);
        if (!answers.contains(currentUid)) {
          transaction
              .update(_firestore.collection('questions').doc(questionId), {
            'answers': FieldValue.arrayUnion([currentUid]),
          });
        }
      });
      if (parentCommentId != null && parentCommentId.isNotEmpty) {
        final updateReplyComment = updatecomment.copyWith(
          parentCommentId: parentCommentId,
        );
        await reference
            .doc(parentCommentId)
            .update({'replies': FieldValue.increment(1)});
        await reference
            .doc(parentCommentId)
            .collection('replies')
            .doc(commentId)
            .set(updateReplyComment.toJson());
        return right(updateReplyComment);
      } else {
        await reference.doc(commentId).set(updatecomment.toJson());
        return right(updatecomment);
      }
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<Comment>>> getAllQuestionComments({
    String? userId,
    String? parentCommentId,
    required String questionId,
  }) async {
    try {
      Query<Map<String, dynamic>> query;
      final data = _firestore
          .collection('questions')
          .doc(questionId)
          .collection('comments');
      if (parentCommentId != null && parentCommentId.isNotEmpty) {
        query = data.doc(parentCommentId).collection('replies');
      } else {
        query = data;
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
  Future<Either<PostError, Unit>> updateLike({
    required String questionId,
    String? subCommentId,
    required String commentId,
    required bool isLike,
  }) async {
    try {
      final userId = _auth.currentUser!.uid;
      final DocumentReference reference = _firestore
          .collection('questions')
          .doc(questionId)
          .collection('comments')
          .doc(commentId);
      if (subCommentId != null) {
        await reference.collection('replies').doc(subCommentId).update(
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
