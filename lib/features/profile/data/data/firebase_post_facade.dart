import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/profile/data/data/firebase_storage_image_methods.dart';
import 'package:w_sharme_beauty/features/profile/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/repositories.dart';

@LazySingleton(as: PostRepository)
class FirestorePostRepository implements PostRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;
  FirestorePostRepository(this.firestore, this.auth, this.storage);

  @override
  Future<Either<PostError, Unit>> addPost(
    Post post,
    List<Uint8List> imageFiles,
  ) async {
    try {
      final String postId = const Uuid().v1();
      final String uid = auth.currentUser!.uid;
      final List<String> imageUrls =
          await FirebaseStorageImageMethods().uploadImageToStorage(imageFiles, true, 'posts');
      final updatedPost = post.copyWith(
        postId: postId,
        createdAt: DateTime.now(),
        uid: uid,
        imageUrls: imageUrls,
      );
      await firestore.collection('posts').doc(postId).set(updatedPost.toJson());
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<Post>>> getPosts() async {
    try {
      final QuerySnapshot querySnapshot =
          await firestore.collection('posts').get();
      final List<Post> posts = querySnapshot.docs
          .map((doc) => Post.fromJson(doc.data()! as Map<String, dynamic>))
          .toList();
      return right(posts);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<Post>>> getMePosts() async {
    try {
      final uuid = auth.currentUser!.uid;
      final QuerySnapshot querySnapshot = await firestore
          .collection('posts')
          .where('uid', isEqualTo: uuid)
          .get();
      final List<Post> posts = querySnapshot.docs
          .map((doc) => Post.fromJson(doc.data()! as Map<String, dynamic>))
          .toList();
      return right(posts);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
