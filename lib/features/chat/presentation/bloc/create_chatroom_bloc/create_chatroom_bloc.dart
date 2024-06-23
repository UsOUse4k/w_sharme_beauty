import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

part 'create_chatroom_event.dart';
part 'create_chatroom_state.dart';
part 'create_chatroom_bloc.freezed.dart';

@injectable
class CreateChatroomBloc
    extends Bloc<CreateChatroomEvent, CreateChatroomState> {
  CreateChatroomBloc(
    this._chatRepository,
    this._getMessagesBloc,
    this._authFacade,
  ) : super(const _Initial()) {
    on<CreateChatroomEvent>((event, emit) async {
      await event.maybeWhen(
        createdChatRoomId: (userId) async {
          emit(const CreateChatroomState.loading());
          try {
            final userOption = await _authFacade.getMeInfo(userId);
            final userMe =
                await _authFacade.getMeInfo(firebaseAuth.currentUser!.uid);
            await userOption.fold((l) async {
              emit(CreateChatroomState.error(errorMessage: l.messasge));
            }, (data) async {
              await userMe.fold((l) async {
                const CreateChatroomState.error(errorMessage: 'error');
              }, (r) async {
                final result = await _chatRepository.createChatRoom(
                  uid: userId,
                  receiverUsername: data.username.toString(),
                  receiverUserAvatar: data.profilePictureUrl.toString(),
                  senderUserAvatar: r.profilePictureUrl.toString(),
                  senderUsername: r.username.toString(),
                );
                await result.fold((erro) async {
                  emit(CreateChatroomState.error(errorMessage: erro.messasge));
                }, (chatRoomId) async {
                  emit(
                    CreateChatroomState.sucsess(
                      chatRoomId: chatRoomId,
                      userId: userId,
                    ),
                  );
                  _getMessagesBloc.add(
                    GetMessagesEvent.getMessages(chatRoomId: chatRoomId),
                  );
                });
              });
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
  final IAuthFacade _authFacade;
}
