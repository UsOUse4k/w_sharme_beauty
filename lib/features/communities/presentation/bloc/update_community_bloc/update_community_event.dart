part of 'update_community_bloc.dart';

@freezed
class UpdateCommunityEvent with _$UpdateCommunityEvent {
  const factory UpdateCommunityEvent.updateCommunity({
    required String communityName,
    required String desc,
    required String category,
    Uint8List? file,
    required String communityId,
  }) = _UpdateCommunity;
}
