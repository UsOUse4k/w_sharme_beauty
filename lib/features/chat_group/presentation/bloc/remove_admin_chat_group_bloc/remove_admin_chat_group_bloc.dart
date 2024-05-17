import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'remove_admin_chat_group_event.dart';
part 'remove_admin_chat_group_state.dart';
part 'remove_admin_chat_group_bloc.freezed.dart';

@injectable
class RemoveAdminChatGroupBloc
    extends Bloc<RemoveAdminChatGroupEvent, RemoveAdminChatGroupState> {
  RemoveAdminChatGroupBloc(this._chatGroupRepository)
      : super(const _Initial()) {
    on<RemoveAdminChatGroupEvent>((event, emit) async {
      await event.maybeWhen(
        removeAdmin: (userId, groupId, type) async {
          emit(const RemoveAdminChatGroupState.loading());
          try {
            final result = await _chatGroupRepository.removeAdminAndUserChatGroup(
              groupId: groupId,
              userId: userId,
              type: type,
            );
            result.fold(
              (l) => emit(RemoveAdminChatGroupState.error(message: l.messasge)),
              (r) => emit(const RemoveAdminChatGroupState.success()),
            );
          } catch (e) {
            emit(const RemoveAdminChatGroupState.success());
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatGroupRepository _chatGroupRepository;
}
