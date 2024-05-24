part of 'update_community_bloc.dart';

@freezed
class UpdateCommunityEvent with _$UpdateCommunityEvent {
  const factory UpdateCommunityEvent.updateCommunity({
    required String communityName,
    String? desc,
    String? category,
    Uint8List? file,
    required String communityId,
  }) = _UpdateCommunity;
}
