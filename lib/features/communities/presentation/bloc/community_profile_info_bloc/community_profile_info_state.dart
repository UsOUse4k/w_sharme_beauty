part of 'community_profile_info_bloc.dart';

@freezed
class CommunityProfileInfoState with _$CommunityProfileInfoState {
  const factory CommunityProfileInfoState.initial() = _Initial;
  const factory CommunityProfileInfoState.succes(UserProfile user) = _Success;
  const factory CommunityProfileInfoState.loading() = _Loading;
  const factory CommunityProfileInfoState.error() = _Error;
  const factory CommunityProfileInfoState.notSignedIn() = _NotSignedIn;
}
