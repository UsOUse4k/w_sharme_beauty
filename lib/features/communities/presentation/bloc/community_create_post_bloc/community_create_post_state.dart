part of 'community_create_post_bloc.dart';

@freezed
class CommunityCreatePostState with _$CommunityCreatePostState {
  const factory CommunityCreatePostState.initial() = _Initial;

  const factory CommunityCreatePostState.loading() = _Loading;

  const factory CommunityCreatePostState.success(Post post) = _Success;

  const factory CommunityCreatePostState.error({required String message}) =
      _Error;
}
