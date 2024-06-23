import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';

import 'package:w_sharme_beauty/core/utils/firebase_storage_url/firebase_storage_image_methods.dart';
import 'package:w_sharme_beauty/core/utils/format_date/date_formatter.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/domain/repositories/i_post_repository.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

@LazySingleton(as: IPostRepository)
class FirestorePostRepository implements IPostRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;
  FirestorePostRepository(
    this.firestore,
    this.auth,
    this.storage,
  );
  @override
  Future<Either<PostError, Post>> createPost({
    required Post post,
    List<Uint8List>? imageFiles,
    required String username,
    required String avatarUrl,
  }) async {
    try {
      final String postId = const Uuid().v1();
      final String authorId = auth.currentUser!.uid;
      final DateTime now = DateTime.now();
      final String formattedDate = DateFormatter.format(now);
      final updatedPost = post.copyWith(
        postId: postId,
        createdAt: formattedDate,
        authorId: authorId,
        username: username,
        avatarUrl: avatarUrl,
      );
      // количество поста у автора
      await firestore.collection('users').doc(authorId).update(
        {'publics': FieldValue.increment(1)},
      );
      // добавим категории автора
      await firestore.runTransaction((transaction) async {
        final snapshot =
            await transaction.get(firestore.collection('users').doc(authorId));
        final docData = snapshot.data();
        final category =
            List<String>.from(docData?['category'] as List<dynamic>);
        if (!category.contains(updatedPost.category)) {
          transaction.update(firestore.collection('users').doc(authorId), {
            'category': FieldValue.arrayUnion([updatedPost.category]),
          });
        }
      });
      if (imageFiles != null && imageFiles.isNotEmpty) {
        final List<String> imageUrls =
            await FirebaseStorageImageMethods(auth, storage)
                .uploadImageToStorage(imageFiles, true, 'posts');
        final updatePostImages = updatedPost.copyWith(imageUrls: imageUrls);
        await firestore
            .collection('posts')
            .doc(postId)
            .set(updatePostImages.toJson());
        return right(updatePostImages);
      } else {
        await firestore
            .collection('posts')
            .doc(postId)
            .set(updatedPost.toJson());
        return right(updatedPost);
      }
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Post>> repostPost({
    required Post post,
    required String username,
    required String avatar,
  }) async {
    try {
      final myUid = auth.currentUser!.uid;
      final String postId = const Uuid().v1();
      final updatePost = post.copyWith(
        authorId: myUid,
        postId: postId,
        avatarUrl: avatar,
        username: username,
        commentsCount: 0,
        repostCount: 0,
        likes: [],
      );
      await firestore.runTransaction((transaction) async {
        final snapshot =
            await transaction.get(firestore.collection('users').doc(myUid));
        final docData = snapshot.data();
        final category =
            List<String>.from(docData?['category'] as List<dynamic>);
        if (!category.contains(updatePost.category)) {
          transaction.update(firestore.collection('users').doc(myUid), {
            'category': FieldValue.arrayUnion([updatePost.category]),
          });
        }
      });
      await firestore.collection('users').doc(myUid).update(
        {'publics': FieldValue.increment(1)},
      );
      await firestore.collection('posts').doc(post.postId).update(
        {'repostCount': FieldValue.increment(1)},
      );
      await firestore.collection('posts').doc(postId).set(updatePost.toJson());
      return right(updatePost);
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
            .where('authorId', isEqualTo: userId)
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

  @override
  Future<Either<PostError, Unit>> updateLikes(
    String postId,
    String userId,
    bool add,
  ) async {
    try {
      await firestore.collection('posts').doc(postId).update({
        'likes': add
            ? FieldValue.arrayUnion([userId])
            : FieldValue.arrayRemove([userId]),
      });
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Post>> getPost(
    String? postId,
    String? userId,
  ) async {
    try {
      if (postId == null) {
        return left(PostError('no Post id'));
      }
      final DocumentSnapshot postSnapshot =
          await firestore.collection('posts').doc(postId).get();
      if (!postSnapshot.exists) {
        return left(PostError('Post not found.'));
      }
      final Post postData =
          Post.fromStoreData(postSnapshot.data()! as Map<String, dynamic>);
      return right(postData);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Unit>> updatePost(
    String postId,
    String authorId,
    String targetUid,
    bool type,
  ) async {
    final currentUid = firebaseAuth.currentUser!.uid;
    try {
      await firestore.runTransaction(
        (transaction) async {
          final querySnapshot = await firestore
              .collection('posts')
              .where('authorId', isEqualTo: authorId)
              .get();
          for (final doc in querySnapshot.docs) {
            final List<dynamic> postFollowers =
                doc.data()['followers'] as List<dynamic>? ?? [];
            if (type) {
              if (!postFollowers.contains(currentUid)) {
                postFollowers.add(currentUid);
                transaction.update(doc.reference, {'followers': postFollowers});
              }
            } else {
              if (postFollowers.contains(currentUid)) {
                postFollowers.remove(currentUid);
                transaction.update(doc.reference, {'followers': postFollowers});
              }
            }
          }
        },
      );

      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
