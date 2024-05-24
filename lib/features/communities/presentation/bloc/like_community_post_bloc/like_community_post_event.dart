part of 'like_community_post_bloc.dart';

@freezed
class LikeCommunityPostEvent with _$LikeCommunityPostEvent {
  const factory LikeCommunityPostEvent.toggleLikes({
    required Post post,
  }) = _ToggleLikes;
}
