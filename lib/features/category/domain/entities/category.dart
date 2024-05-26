import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    @Default('') String? title,
    @Default('') String? image,
    @Default('') String? categoryId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.fromStoreData(Map<String, dynamic> firestoreData) {
    return Category(
      title: firestoreData['title'] as String?,
      image: firestoreData['image'] as String?,
      categoryId: firestoreData['categoryId'] as String?,
    );
  }
}
