part of 'community_list_bloc.dart';

@freezed
class CommunityListEvent with _$CommunityListEvent {
  const factory CommunityListEvent.getCommunities() = _GetCommunities;
  const factory CommunityListEvent.searchCommunities({String? query}) = _SearchCommunities;
  const factory CommunityListEvent.searchCommunityChatGroup({String? query}) = _SearchCommunityChatGroup;
  const factory CommunityListEvent.filterCommunity({required String filterCommunity}) = _FilterCommunity;
}
