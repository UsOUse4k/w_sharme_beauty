import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'send_message_group_event.dart';
part 'send_message_group_state.dart';
part 'send_message_group_bloc.freezed.dart';

@injectable
class SendMessageGroupBloc
    extends Bloc<SendMessageGroupEvent, SendMessageGroupState> {
  SendMessageGroupBloc(
    this._chatGroupRepository,
    this._authFacade,
  ) : super(const _Initial()) {
    on<SendMessageGroupEvent>((event, emit) async {
      await event.maybeWhen(
        sendMessage: (groupId, message, file, communityId) async {
          emit(const SendMessageGroupState.loading());
          try {
            final userOption = await _authFacade.getSignedInUser();
            await userOption.fold(() async {
              emit(
                const SendMessageGroupState.error(
                  message: 'not User sign in',
                ),
              );
            }, (userData) async {
              final data = await _authFacade.getMeInfo(userData.uid);
              await data.fold((l) {
                emit(SendMessageGroupState.error(message: l.messasge));
              }, (user) async {
                final result = await _chatGroupRepository.sendMessage(
                  file: event.file,
                  message: message,
                  groupId: groupId,
                  receiverId: '',
                  username: user.username.toString(),
                  avatarUrl: user.profilePictureUrl.toString(),
                  communityId: communityId,
                );
                result.fold(
                  (error) {
                    emit(SendMessageGroupState.error(message: error.messasge));
                  },
                  (success) {
                    emit(const SendMessageGroupState.success());
                  },
                );
              });
            });
          } catch (e) {
            emit(SendMessageGroupState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatGroupRepository _chatGroupRepository;
  final IAuthFacade _authFacade;
}
