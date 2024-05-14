import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart';

part 'send_message_event.dart';
part 'send_message_state.dart';
part 'send_message_bloc.freezed.dart';

@injectable
class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  SendMessageBloc(
    this._chatRepository,
    this._getMessagesBloc,
    this._authFacade,
  ) : super(const _Initial()) {
    on<SendMessageEvent>((event, emit) async {
      await event.maybeWhen(
        sendMessage: (chatRoomId, message, receiverId, file) async {
          emit(const SendMessageState.loading());
          try {
            final userOption = await _authFacade.getSignedInUser();
            await userOption.fold(
              () {
                emit(const SendMessageState.error(message: 'not user sign in'));
              },
              (dataUser) async {
                final userData =
                    await _authFacade.getMeInfo(dataUser.uid);
                await userData.fold(
                  (error) async {
                    emit(SendMessageState.error(message: error.messasge));
                  },
                  (getMedata) async {
                    final result = await _chatRepository.sendMessage(
                      file: file,
                      message: message,
                      chatRoomId: chatRoomId,
                      receiverId: receiverId,
                      username: getMedata.username.toString(),
                      avatarUrl: getMedata.profilePictureUrl.toString(),
                    );
                    await result.fold((error) async {
                      emit(SendMessageState.error(message: error.messasge));
                    }, (success) async {
                      emit(const SendMessageState.success());
                      _getMessagesBloc.add(
                        GetMessagesEvent.getMessages(chatRoomId: chatRoomId),
                      );
                    });
                  },
                );
              },
            );
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
  final IAuthFacade _authFacade;
}
