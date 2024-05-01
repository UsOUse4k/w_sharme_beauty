import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/profile/domain/entities/entities.dart';

abstract class PostRepository {
  Future<Either<PostError, Unit>> addPost(Post post, List<Uint8List> imageFiles);
  Future<Either<PostError, List<Post>>> getPosts();
  Future<Either<PostError, List<Post>>> getMePosts();

}
