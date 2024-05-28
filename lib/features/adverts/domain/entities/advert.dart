import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert.freezed.dart';
part 'advert.g.dart';

@freezed
class Advert with _$Advert {
  const factory Advert({
    String? authorId,
    String? advertId,
    String? sloonName,
    String? category,
    String? address,
    String? phoneNumber,
    String? description,
    String? schedule,
    String? productServices,
    @Default([]) List<String> imageUrls,
    @Default('') String? avatarUrl,
    String? videoUrl,
    @Default(0) int commentsCount,
    @Default([]) List<String> likes,
    @Default([]) List<String> reposts,
    @Default(false) bool isFavorite,
    @Default('') String? createdAt,
  }) = _Advert;

  factory Advert.fromJson(Map<String, dynamic> json) => _$AdvertFromJson(json);

  factory Advert.fromStoreData(Map<String, dynamic> firestoreData) {
    return Advert(
      authorId: firestoreData['authorId'] as String?,
      avatarUrl: firestoreData['avatarUrl'] as String?,
      sloonName: firestoreData['username'] as String?,
      advertId: firestoreData['postId'] as String?,
      category: firestoreData['category'] as String?,
      address: firestoreData['address'] as String?,
      phoneNumber: firestoreData['phoneNumber'] as String?,
      schedule: firestoreData['schedule'] as String?,
      productServices: firestoreData['productServices'] as String?,
      description: firestoreData['text'] as String?,
      createdAt: firestoreData['createdAt'] as String? ?? '',
      imageUrls:
          List<String>.from(firestoreData['imageUrls'] as List<dynamic>? ?? []),
      videoUrl: firestoreData['videoUrl'] as String? ?? '',
      likes: List<String>.from(firestoreData['likes'] as List<dynamic>? ?? []),
      commentsCount: firestoreData['commentsCount'] as int,
      isFavorite: firestoreData['isFavorite'] as bool? ?? false,
    );
  }
}
