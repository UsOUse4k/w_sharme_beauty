import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/repositiories/i_comment_repository.dart';

@LazySingleton(as: ICommentRepository)
class FirebaseCommentFacade implements ICommentRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  FirebaseCommentFacade(this.firestore, this.auth);
  @override
  Future<Either<PostError, Unit>> createComment(
    String? userId,
    String? username,
    Comment? comment,
    String? avatarUrl,
  ) async {
    try {
      final String commentId = const Uuid().v1();
      await firestore
          .collection('posts')
          .doc()
          .collection('comments')
          .doc(commentId)
          .set({});
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
