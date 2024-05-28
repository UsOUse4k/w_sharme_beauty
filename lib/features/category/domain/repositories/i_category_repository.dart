import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/category/domain/entities/category.dart';

abstract class ICategoryRepository {
  Future<Either<PostError, List<Category>>> getAllCategories();
  Future<Either<PostError, Category>> getCategory({
    required String categoryId,
  });
}
