import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/category/domain/entities/category.dart';
import 'package:w_sharme_beauty/features/category/domain/repositories/i_category_repository.dart';

@LazySingleton(as: ICategoryRepository)
class FirebaseCategoryFacade implements ICategoryRepository {
  final FirebaseFirestore firestore;
  FirebaseCategoryFacade(this.firestore);

  @override
  Future<Either<PostError, List<Category>>> getAllCategories() async {
    try {
      final QuerySnapshot querySnapshot;
      querySnapshot = await firestore.collection('categories').get();
      final List<Category> categories = querySnapshot.docs
          .map(
            (doc) => Category.fromJson(doc.data()! as Map<String, dynamic>),
          )
          .toList();
      return right(categories);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Category>> getCategory({
    required String categoryId,
  }) async {
    try {
      final DocumentSnapshot categorySnapshot =
          await firestore.collection('categories').doc(categoryId).get();
      if (!categorySnapshot.exists) {
        return left(PostError('Category not found.'));
      }
      final Category categoryData = Category.fromStoreData(
        categorySnapshot.data()! as Map<String, dynamic>,
      );
      return right(categoryData);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
