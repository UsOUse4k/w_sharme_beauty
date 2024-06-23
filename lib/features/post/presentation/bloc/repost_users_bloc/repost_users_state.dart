part of 'repost_users_bloc.dart';

@freezed
class RepostUsersState with _$RepostUsersState {
  const factory RepostUsersState.selectedUserId({
    @Default([]) List<String> selectecUserIds,
  }) = _SelectedUserId;
}
