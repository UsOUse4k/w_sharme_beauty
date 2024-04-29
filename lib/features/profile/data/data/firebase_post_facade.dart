import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/profile/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/repositories.dart';

@LazySingleton(as: PostRepository)
class FirestorePostRepository implements PostRepository {
  final FirebaseFirestore firestore;

  FirestorePostRepository(this.firestore);

  @override
  Future<Either<PostError, Unit>> addPost(Post post) async {
    try {
      await firestore.collection('posts').add(post.toJson());
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
