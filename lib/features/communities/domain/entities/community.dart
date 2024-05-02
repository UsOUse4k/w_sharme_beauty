import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@freezed
class Community with _$Community {
  factory Community({
    required String id,
    required String name,
    required String imageUrl,
    required String description,
  }) = _Community;

  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
}
