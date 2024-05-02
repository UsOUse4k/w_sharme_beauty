import 'package:freezed_annotation/freezed_annotation.dart';

part 'communities.freezed.dart';
part 'communities.g.dart';

@freezed
class Communities with _$Communities {
  factory Communities({
    required String id,
    required String name,
    required String imageUrl,
    required String description,
  }) = _Communities;

  factory Communities.fromJson(Map<String, dynamic> json) =>
      _$CommunitiesFromJson(json);
}
