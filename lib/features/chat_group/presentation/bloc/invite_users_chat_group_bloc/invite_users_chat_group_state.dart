part of 'invite_users_chat_group_bloc.dart';

@freezed
class InviteUsersChatGroupState with _$InviteUsersChatGroupState {
  const factory InviteUsersChatGroupState.initial() = _Initial;
  const factory InviteUsersChatGroupState.success() = _Success;
  const factory InviteUsersChatGroupState.loading() = _Loading;
  const factory InviteUsersChatGroupState.error({required String message}) = _Error;

}
