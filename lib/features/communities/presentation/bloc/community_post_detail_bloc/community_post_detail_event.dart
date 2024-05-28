part of 'community_post_detail_bloc.dart';

@freezed
class CommunityPostDetailEvent with _$CommunityPostDetailEvent {
  const factory CommunityPostDetailEvent.getPost({
    required String communityId,
    required String postId,
  }) = _GetPost;
}
