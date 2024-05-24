import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'update_manager_chat_group_event.dart';
part 'update_manager_chat_group_state.dart';
part 'update_manager_chat_group_bloc.freezed.dart';

@injectable
class UpdateManagerChatGroupBloc
    extends Bloc<UpdateManagerChatGroupEvent, UpdateManagerChatGroupState> {
  UpdateManagerChatGroupBloc(this._chatGroupRepository)
      : super(const _Initial()) {
    on<UpdateManagerChatGroupEvent>((event, emit) async {
      await event.maybeWhen(
        updateManagerChatGroup: (
          editors,
          administrator,
          groupId,
          communityId,
        ) async {
          emit(const UpdateManagerChatGroupState.loading());
          try {
            final result = await _chatGroupRepository.updateGroup(
              groupId: groupId,
              groupRoom: ChatGroupRoom(
                administrator: administrator,
                editors: editors,
              ),
              communityId: communityId,
            );
            result.fold(
                (l) => emit(
                      UpdateManagerChatGroupState.error(message: l.messasge),
                    ), (r) {
              emit(const UpdateManagerChatGroupState.success());
            });
          } catch (e) {
            emit(UpdateManagerChatGroupState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatGroupRepository _chatGroupRepository;
}
