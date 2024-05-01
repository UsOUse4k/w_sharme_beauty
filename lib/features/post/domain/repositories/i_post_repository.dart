import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';

abstract class IPostRepository {
  Future<Either<PostError, Unit>> createPost(Post post);
  Future<Either<PostError, List<Post>>> getPosts({String? userId});
}
