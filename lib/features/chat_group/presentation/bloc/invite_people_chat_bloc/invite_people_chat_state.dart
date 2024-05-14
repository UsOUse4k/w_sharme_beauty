part of 'invite_people_chat_bloc.dart';

@freezed
class InvitePeopleChatState with _$InvitePeopleChatState {
  const factory InvitePeopleChatState.selected({
    @Default([]) List<UserProfile> selectedUsers,
  }) = _Selected;
}
