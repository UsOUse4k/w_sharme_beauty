import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/domain/repositories/repositories.dart';

@LazySingleton(as: IPostRepository)
class FirestorePostRepository implements IPostRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  FirestorePostRepository(this.firestore, this.auth);

  @override
  Future<Either<PostError, Unit>> createPost(Post post) async {
    try {
      final String postId = const Uuid().v1();
      final String uid = auth.currentUser!.uid;
      final updatedPost = post.copyWith(
        postId: postId,
        createdAt: DateTime.now(),
        uid: uid,
      );
      await firestore.collection('posts').doc(postId).set(updatedPost.toJson());
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<Post>>> getPosts({String? userId}) async {
    try {
      late final QuerySnapshot querySnapshot;

      if (userId != null) {
        querySnapshot = await firestore
            .collection('posts')
            .where('uid', isEqualTo: userId)
            .get();
      } else {
        querySnapshot = await firestore.collection('posts').get();
      }

      final List<Post> posts = querySnapshot.docs
          .map(
            (doc) => Post.fromJson(doc.data()! as Map<String, dynamic>),
          )
          .toList();

      return right(posts);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
