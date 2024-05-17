import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'invite_users_chat_group_event.dart';
part 'invite_users_chat_group_state.dart';
part 'invite_users_chat_group_bloc.freezed.dart';

@injectable
class InviteUsersChatGroupBloc
    extends Bloc<InviteUsersChatGroupEvent, InviteUsersChatGroupState> {
  InviteUsersChatGroupBloc(this._chatGroupRepository)
      : super(const _Initial()) {
    on<InviteUsersChatGroupEvent>((event, emit) async {
      await event.maybeWhen(
        inviteUsersChatGroup: (userIds, groupId) async {
          emit(const InviteUsersChatGroupState.loading());
          try {
            final result = await _chatGroupRepository.addedUserChatGroup(
              groupId: groupId,
              userIds: userIds,
            );
            result.fold(
              (l) => emit(InviteUsersChatGroupState.error(message: l.messasge)),
              (r) => emit(const InviteUsersChatGroupState.success()),
            );
          } catch (e) {
            emit(InviteUsersChatGroupState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatGroupRepository _chatGroupRepository;
}
