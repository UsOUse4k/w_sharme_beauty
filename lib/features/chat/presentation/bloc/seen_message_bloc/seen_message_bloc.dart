import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';

part 'seen_message_event.dart';
part 'seen_message_state.dart';
part 'seen_message_bloc.freezed.dart';

@injectable
class SeenMessageBloc extends Bloc<SeenMessageEvent, SeenMessageState> {
  SeenMessageBloc(this._chatRepository) : super(const _Initial()) {
    on<SeenMessageEvent>((event, emit) async {
      await event.maybeWhen(
        seenMessage: (chatRoomId, messageId, senderId) async {
          emit(const SeenMessageState.loading());
          final result = await _chatRepository.seenMessage(chatRoomId: chatRoomId, senderId: senderId);
          result.fold((error) {
            emit(SeenMessageState.error(message: error.messasge));
          }, (success)  {
            emit(const SeenMessageState.success());
          });
        },
        orElse: () {},
      );
    });
  }
  final IChatRepository _chatRepository;
}
