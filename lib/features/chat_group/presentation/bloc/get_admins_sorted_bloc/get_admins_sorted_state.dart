part of 'get_admins_sorted_bloc.dart';

@freezed
class GetAdminsSortedState with _$GetAdminsSortedState {
  const factory GetAdminsSortedState.initial() = _Initial;
  const factory GetAdminsSortedState.sorted(List<UserProfile> sortedAdmins) = _Sorted;
}
