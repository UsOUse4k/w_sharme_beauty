part of 'subscribe_community_bloc.dart';

@freezed
class SubscribeCommunityEvent with _$SubscribeCommunityEvent {
  const factory SubscribeCommunityEvent.subscribeCommunity({
    String? targetUid,
    String? chatGroupId,
    String? communityId,
  }) = _SubscribeCommunity;
  const factory SubscribeCommunityEvent.unsubscribeCommunity({
    String? targetUid,
    String? chatGroupId,
    String? communityId,
  }) = _UnSubscribeCommunity;
}
