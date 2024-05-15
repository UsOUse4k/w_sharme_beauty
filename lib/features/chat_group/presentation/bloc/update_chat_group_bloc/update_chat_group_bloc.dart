import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'update_chat_group_event.dart';
part 'update_chat_group_state.dart';
part 'update_chat_group_bloc.freezed.dart';

@injectable
class UpdateChatGroupBloc
    extends Bloc<UpdateChatGroupEvent, UpdateChatGroupState> {
  UpdateChatGroupBloc(this._chatGroupRepository) : super(const _Initial()) {
    on<UpdateChatGroupEvent>((event, emit) async {
      await event.maybeWhen(
        updateChatGroup: (groupId, groupName, file) async {
          emit(const UpdateChatGroupState.loading());
          try {
            final result = await _chatGroupRepository.updateGroup(
              groupId: groupId,
              file: file,
              groupName: groupName,
            );
            result.fold((l) {
              emit(UpdateChatGroupState.error(message: l.messasge));
            }, (r) {
              emit(const UpdateChatGroupState.success());
            });
          } catch (e) {
            emit(UpdateChatGroupState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatGroupRepository _chatGroupRepository;
}
