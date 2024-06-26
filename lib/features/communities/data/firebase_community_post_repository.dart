import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/core/utils/firebase_storage_url/firebase_storage_image_methods.dart';
import 'package:w_sharme_beauty/core/utils/format_date/date_formatter.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_post_repository.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';

@LazySingleton(as: ICommunityPostRepository)
class FirestorePostRepository implements ICommunityPostRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;
  FirestorePostRepository(this.firestore, this.auth, this.storage);
  @override
  Future<Either<PostError, Post>> createPost(
    Post post, {
    required String communityId,
    List<Uint8List>? imageFiles,
    XFile? video,
  }) async {
    try {
      final String postId = const Uuid().v1();
      final String authorId = auth.currentUser!.uid;
      final DateTime now = DateTime.now();
      final String formattedDate = DateFormatter.format(now);
      final DocumentReference reference =
          firestore.collection('communities').doc(communityId);
      final updatedPost = post.copyWith(
        postId: postId,
        createdAt: formattedDate,
        authorId: authorId,
      );
      await reference.update({
        'public': FieldValue.increment(1),
      });
      if (imageFiles != null && imageFiles.isNotEmpty) {
        final List<String> imageUrls =
            await FirebaseStorageImageMethods(auth, storage)
                .uploadImageToStorage(imageFiles, true, 'communities_posts');
        final updatePostImages = updatedPost.copyWith(
          imageUrls: imageUrls,
        );
        await reference
            .collection('posts')
            .doc(postId)
            .set(updatePostImages.toJson());
        return right(updatePostImages);
      } else if (video != null) {
        final String videoUrl = await FirebaseStorageImageMethods(auth, storage)
            .uploadVideoToStorage(video, 'communities_posts');
        final updatePostVideo = updatedPost.copyWith(videoUrl: videoUrl);
        await reference
            .collection('posts')
            .doc(postId)
            .set(updatePostVideo.toJson());
        return right(updatePostVideo);
      } else {
        await reference
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
  Future<Either<PostError, List<Post>>> getPosts({
    required String communityId,
  }) async {
    try {
      final QuerySnapshot querySnapshot = await firestore
          .collection('communities')
          .doc(communityId)
          .collection('posts')
          .get();

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
    bool add, {
    required String communityId,
  }) async {
    try {
      await firestore
          .collection('communities')
          .doc(communityId)
          .collection('posts')
          .doc(postId)
          .update({
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
  Future<Either<PostError, Post>> getPost({
    required String communityId,
    required String postId,
  }) async {
    try {
      final DocumentSnapshot postSnapshot = await firestore
          .collection('communities')
          .doc(communityId)
          .collection('posts')
          .doc(postId)
          .get();
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
}
