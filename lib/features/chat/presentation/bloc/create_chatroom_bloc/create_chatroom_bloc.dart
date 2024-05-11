import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart';

part 'create_chatroom_event.dart';
part 'create_chatroom_state.dart';
part 'create_chatroom_bloc.freezed.dart';

@injectable
class CreateChatroomBloc
    extends Bloc<CreateChatroomEvent, CreateChatroomState> {
  CreateChatroomBloc(this._chatRepository, this._getMessagesBloc)
      : super(const _Initial()) {
    on<CreateChatroomEvent>((event, emit) async {
      await event.maybeWhen(
        createdChatRoomId: (chatRoomId) async {
          emit(const CreateChatroomState.loading());
          try {
            final result =
                await _chatRepository.createChatRoom(uid: chatRoomId);
            await result.fold((erro) async {
              emit(CreateChatroomState.error(errorMessage: erro.messasge));
            }, (chatRoomId) async {
              emit(CreateChatroomState.sucsess(chatRoomId: chatRoomId));
              _getMessagesBloc
                  .add(GetMessagesEvent.getMessages(chatRoomId: chatRoomId));
            });
          } catch (e) {
            emit(CreateChatroomState.error(errorMessage: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final GetMessagesBloc _getMessagesBloc;
  final IChatRepository _chatRepository;
}
