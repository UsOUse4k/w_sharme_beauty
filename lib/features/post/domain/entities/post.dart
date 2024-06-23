import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    String? authorId,
    String? postId,
    String? username,
    String? category,
    required String text,
    @Default([]) List<String> imageUrls,
    @Default('') String? avatarUrl,
    String? videoUrl,
    @Default(0) int commentsCount,
    @Default(0) int repostCount,
    @Default([]) List<String> likes,
    @Default([]) List<String> reposts,
    @Default([]) List<String>? followers,
    @Default([]) List<String>? subscriptions,
    @Default(false) bool isFavorite,
    @Default('') String? createdAt,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromStoreData(Map<String, dynamic> firestoreData) {
    return Post(
      authorId: firestoreData['authorId'] as String?,
      avatarUrl: firestoreData['avatarUrl'] as String?,
      username: firestoreData['username'] as String?,
      postId: firestoreData['postId'] as String?,
      text: firestoreData['text'] as String? ?? '',
      category: firestoreData['category'] as String? ?? '',
      createdAt: firestoreData['createdAt'] as String? ?? '',
      imageUrls:
          List<String>.from(firestoreData['imageUrls'] as List<dynamic>? ?? []),
      videoUrl: firestoreData['videoUrl'] as String? ?? '',
      likes: List<String>.from(firestoreData['likes'] as List<dynamic>? ?? []),
      followers: List<String>.from(firestoreData['followers'] as List<dynamic>? ?? []),
      subscriptions: List<String>.from(firestoreData['subscriptions'] as List<dynamic>? ?? []),
      commentsCount: firestoreData['commentsCount'] as int,
      repostCount: firestoreData['repostCount'] as int,
      isFavorite: firestoreData['isFavorite'] as bool? ?? false,
    );
  }
}
