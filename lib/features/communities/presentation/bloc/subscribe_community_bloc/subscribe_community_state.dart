part of 'subscribe_community_bloc.dart';

@freezed
class SubscribeCommunityState with _$SubscribeCommunityState {
  const factory SubscribeCommunityState.initial() = _Initial;
  const factory SubscribeCommunityState.success() = _Success;
  const factory SubscribeCommunityState.error({required String message}) = _Error;
  const factory SubscribeCommunityState.loading() = _Loading;

}
