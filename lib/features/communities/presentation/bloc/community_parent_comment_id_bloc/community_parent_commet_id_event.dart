part of 'community_parent_commet_id_bloc.dart';

@freezed
class CommunityParentCommetIdEvent with _$CommunityParentCommetIdEvent {
  const factory CommunityParentCommetIdEvent.addCommunityParentCommetId(
    String parentCommentId,
    String username,
  ) = _AddCommunityParentCommetId;
}
