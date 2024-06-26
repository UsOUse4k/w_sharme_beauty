import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';

abstract class ICommunityPostRepository {
  Future<Either<PostError, Post>> createPost(
    Post post, {
    List<Uint8List>? imageFiles,
    XFile? video,
    required String communityId,
  });
  Future<Either<PostError, List<Post>>> getPosts({
    required String communityId,
  });
  Future<Either<PostError, Post>> getPost({
    required String communityId,
    required String postId,
  });
  Future<Either<PostError, Unit>> updateLikes(
    String postId,
    String authorId,
    bool add, {
    required String communityId,
  });
}
