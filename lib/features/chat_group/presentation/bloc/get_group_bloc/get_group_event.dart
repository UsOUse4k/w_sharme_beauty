part of 'get_group_bloc.dart';

@freezed
class GetGroupEvent with _$GetGroupEvent {
  const factory GetGroupEvent.getGroup({
    required String groupId,
    required String communityId,
  }) = _GetGroup;
  const factory GetGroupEvent.searchUsers({
    required String query,
  }) = _SearchUsers;
}
