import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'create_chat_group_event.dart';
part 'create_chat_group_state.dart';
part 'create_chat_group_bloc.freezed.dart';

@injectable
class CreateChatGroupBloc
    extends Bloc<CreateChatGroupEvent, CreateChatGroupState> {
  CreateChatGroupBloc(this._chatGroupRepository) : super(const _Initial()) {
    on<CreateChatGroupEvent>((event, emit) async {
      await event.maybeWhen(
        createChatGroup: (chatGroup, file, communityId) async {
          emit(const CreateChatGroupState.loading());
          try {
            final result = await _chatGroupRepository.createChatGroup(
              chatGroupRoom: chatGroup,
              file: file,
              communityId: communityId,
            );
            result.fold((error) {
              emit(CreateChatGroupState.error(message: error.messasge));
            }, (groupId) async {
              emit(CreateChatGroupState.success(groupId: groupId));
            });
          } catch (e) {
            emit(CreateChatGroupState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }

  final IChatGroupRepository _chatGroupRepository;
}
