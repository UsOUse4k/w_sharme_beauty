import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/chat_room.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';

part 'get_all_chats_event.dart';
part 'get_all_chats_state.dart';
part 'get_all_chats_bloc.freezed.dart';

@injectable
class GetAllChatsBloc extends Bloc<GetAllChatsEvent, GetAllChatsState> {
  List<ChatRoom>? allChatRoom;
  GetAllChatsBloc(this._chatRepository)
      : super(const _Initial()) {
    on<GetAllChatsEvent>(
      (event, emit) async {
        await event.maybeWhen(
          getAllChatRoom: () async {
            emit(const GetAllChatsState.loading());
            final streamResponse = _chatRepository.getAllChats();
            await for (final chats in streamResponse) {
              allChatRoom = chats;              
              emit(GetAllChatsState.success(chats));
            }
          },
          searchChat: (query) {
            if (state is _Success && allChatRoom != null) {
              if (query.isEmpty) {
                emit(GetAllChatsState.success(allChatRoom!));
              } else {
                final filteredChatRoom = allChatRoom!
                  .where(
                    (room) => room.receiverUsername!
                        .toLowerCase()
                        .contains(query.toLowerCase()),
                  )
                  .toList();
              emit(GetAllChatsState.success(filteredChatRoom));
              }
            }
          },
          orElse: () {},
        );
      },
    );
  }

  final IChatRepository _chatRepository;
}
