part of 'get_admins_sorted_bloc.dart';

@freezed
class GetAdminsSortedEvent with _$GetAdminsSortedEvent {
  const factory GetAdminsSortedEvent.sortAdmins({
    required UserProfile owner,
    required List<UserProfile> administrators,
    required List<UserProfile> editors,
  }) = _SortAdmins;
  const factory GetAdminsSortedEvent.searchUsers({
    required String query,
  }) = _SearchUsers;
}
