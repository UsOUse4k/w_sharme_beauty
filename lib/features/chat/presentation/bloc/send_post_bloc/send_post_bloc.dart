import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

part 'send_post_event.dart';
part 'send_post_state.dart';
part 'send_post_bloc.freezed.dart';

@injectable
class SendPostBloc extends Bloc<SendPostEvent, SendPostState> {
  SendPostBloc(this._chatRepository, this._authFacade)
      : super(const _Initial()) {
    on<_SendPost>((event, emit) async {
      emit(const SendPostState.loading());
      try {
        final userInfo =
            await _authFacade.getMeInfo(firebaseAuth.currentUser!.uid);
        await userInfo.fold(
          (l) async => emit(const SendPostState.error(message: 'error')),
          (r) async {
            final result = await _chatRepository.sendPost(
              chatRoomId: event.chatRoomId,
              receiverId: event.receiverId,
              username: r.username.toString(),
              avatarUrl: r.profilePictureUrl.toString(),
              post: event.post,
            );
            result.fold(
              (l) => emit(SendPostState.error(message: l.messasge)),
              (r) => emit(const SendPostState.success()),
            );
          },
        );
      } catch (e) {
        emit(SendPostState.error(message: e.toString()));
      }
    });
  }
  final IAuthFacade _authFacade;
  final IChatRepository _chatRepository;
}
