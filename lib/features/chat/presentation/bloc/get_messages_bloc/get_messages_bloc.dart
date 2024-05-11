import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';

part 'get_messages_event.dart';
part 'get_messages_state.dart';
part 'get_messages_bloc.freezed.dart';

@injectable
class GetMessagesBloc extends Bloc<GetMessagesEvent, GetMessagesState> {
  GetMessagesBloc(this._chatRepository) : super(const _Initial()) {
    on<GetMessagesEvent>((event, emit) async {
      await event.maybeWhen(
        getMessages: (chatRoomId) async {
          emit(const GetMessagesState.loading());
          try {
            await for (final messages
                in _chatRepository.getMessages(chatRoomId: chatRoomId)) {
              emit(GetMessagesState.success(messages));
            }
          } catch (e) {
            emit(GetMessagesState.error(message: e.toString()));
          }
        },
        addNewMessage: (message) {
          state.maybeWhen(
            success: (messages) {
              emit(GetMessagesState.success([message, ...messages]));
            },
            orElse: () {},
          );
        },
        orElse: () {},
      );
    });
  }
  final IChatRepository _chatRepository;
}
