import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';

part 'stories.freezed.dart';
part 'stories.g.dart';


@freezed
class Stories with _$Stories {
  const factory Stories({
    String? uid,
    String? title,
    String? imageUrl,
    String? videoUrl,
    @Default(false) bool isFavorite,
    @TimestampConverter() DateTime? createdAt,
  }) = _Stories;

  factory Stories.fromJson(Map<String, dynamic> json) =>
      _$StoriesFromJson(json);
}
