part of 'invite_people_chat_bloc.dart';

@freezed
class InvitePeopleChatEvent with _$InvitePeopleChatEvent {
  const factory InvitePeopleChatEvent.toggleUserSelection(UserProfile user) = _ToggleUserSelection;
}
