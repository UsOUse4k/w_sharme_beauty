import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';

abstract class IPostRepository {
  Future<Either<PostError, Post>> createPost({
    required Post post,
    List<Uint8List>? imageFiles,
    required String username,
    required String avatarUrl,
  });
  Future<Either<PostError, Post>> repostPost({
    required Post post,
    required String username,
    required String avatar,
  });
  Future<Either<PostError, List<Post>>> getPosts({String? userId});
  Future<Either<PostError, Unit>> updateLikes(
    String postId,
    String authorId,
    bool add,
  );
  Future<Either<PostError, Unit>> updatePost(
    String postId,
    String authorId,
    String targetUid,
    bool type,
  );
  Future<Either<PostError, Post>> getPost(String postId, String? userId);
}
