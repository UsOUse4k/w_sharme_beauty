part of 'community_profile_info_bloc.dart';

@freezed
class CommunityProfileInfoEvent with _$CommunityProfileInfoEvent {
  const factory CommunityProfileInfoEvent.getMe() = _getMe;
}
