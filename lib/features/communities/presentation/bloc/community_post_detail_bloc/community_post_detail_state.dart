part of 'community_post_detail_bloc.dart';

@freezed
class CommunityPostDetailState with _$CommunityPostDetailState {
  const factory CommunityPostDetailState.initial() = _Initial;
  const factory CommunityPostDetailState.success({required Post post}) =
      _Success;
  const factory CommunityPostDetailState.error({required String error}) =
      _Error;
  const factory CommunityPostDetailState.loading() = _Loading;
}
