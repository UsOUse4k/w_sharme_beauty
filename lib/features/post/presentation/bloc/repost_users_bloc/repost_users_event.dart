part of 'repost_users_bloc.dart';

@freezed
class RepostUsersEvent with _$RepostUsersEvent {
  const factory RepostUsersEvent.addUserdIds(String uid) = _AddUserIds;
}
