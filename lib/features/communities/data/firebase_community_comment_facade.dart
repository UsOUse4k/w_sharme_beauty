import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_comment_repository.dart';

@LazySingleton(as: ICommunityCommentRepository)
class FirebaseCommunityCommentFacade implements ICommunityCommentRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  FirebaseCommunityCommentFacade(this.firestore, this.auth);

  @override
  Future<Either<PostError, Comment>> createComment({
    required Comment comment,
    required String postId,
    String? parentCommentId,
    String? communityId,
  }) async {
    try {
      final updatedComment = comment.copyWith(
        uid: auth.currentUser!.uid,
      );
      final reference = firestore
          .collection('communities')
          .doc(communityId)
          .collection('posts')
          .doc(postId)
          .collection('comments');
      if (parentCommentId != null && parentCommentId.isNotEmpty) {
        final updateCommentReply = updatedComment.copyWith(
          parentCommentId: parentCommentId,
        );
        await reference
            .doc(parentCommentId)
            .collection('reply_comments')
            .doc(updateCommentReply.commentId)
            .set(updateCommentReply.toJson());
        return right(updateCommentReply);
      } else {
        await reference
            .doc(updatedComment.commentId)
            .set(updatedComment.toJson());
        return right(updatedComment);
      }
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Unit>> updateCountsComment({
    required String postId,
    String? commentId,
    required String communityId,
  }) async {
    try {
      DocumentReference reference;
      reference = firestore
          .collection('communities')
          .doc(communityId)
          .collection('posts')
          .doc(postId);
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
    String? communityId,
  }) async {
    try {
      Query<Map<String, dynamic>> query;
      final refernce = firestore
          .collection('communities')
          .doc(communityId)
          .collection('posts')
          .doc(postId)
          .collection('comments');
      if (parentCommentId != null && parentCommentId.isNotEmpty) {
        query = refernce.doc(parentCommentId).collection('reply_comments');
      } else {
        query = refernce;
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
    required String communityId,
  }) async {
    final userId = auth.currentUser!.uid;
    final DocumentReference reference = firestore
        .collection('communities')
        .doc(communityId)
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

  @override
  Future<Either<PostError, Comment>> getComment({
    required String postId,
    required String commentId,
    required String communityId,
  }) async {
    try {
      final DocumentSnapshot documentSnapshot = await firestore
          .collection('communities')
          .doc(communityId)
          .collection('posts')
          .doc(postId)
          .get();
      final Comment comment = Comment.fromStoreData(
        documentSnapshot.data()! as Map<String, dynamic>,
      );
      return right(comment);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
