import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart';

part 'send_message_event.dart';
part 'send_message_state.dart';
part 'send_message_bloc.freezed.dart';

@injectable
class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  SendMessageBloc(this._chatRepository, this._getMessagesBloc)
      : super(const _Initial()) {
    on<SendMessageEvent>((event, emit) async {
      await event.maybeWhen(
        sendMessage: (chatRoomId, message, receiverId, file) async {
          emit(const SendMessageState.loading());
          try {
            final result = await _chatRepository.sendMessage(
              message: message,
              chatRoomId: chatRoomId,
              receiverId: receiverId,
            );
            await result.fold((error) async {
              emit(SendMessageState.error(message: error.messasge));
            }, (success) async {
              emit(const SendMessageState.success());
              _getMessagesBloc.add(
                GetMessagesEvent.getMessages(chatRoomId: chatRoomId),
              );
            });
          } catch (e) {
            emit(SendMessageState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatRepository _chatRepository;
  final GetMessagesBloc _getMessagesBloc;
}
