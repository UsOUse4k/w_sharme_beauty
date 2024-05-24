import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'get_all_group_messages_event.dart';
part 'get_all_group_messages_state.dart';
part 'get_all_group_messages_bloc.freezed.dart';

@injectable
class GetAllGroupMessagesBloc
    extends Bloc<GetAllGroupMessagesEvent, GetAllGroupMessagesState> {
  GetAllGroupMessagesBloc(this._chatGroupRepository) : super(const _Initial()) {
    on<GetAllGroupMessagesEvent>((event, emit) async {
      await event.maybeWhen(
        getAllGroupMessages: (groupId, communityId) async {
          emit(const GetAllGroupMessagesState.loading());
          try {
            await for (final messages in _chatGroupRepository.getMessages(
              groupId: groupId,
              communityId: communityId,
            )) {
              emit(GetAllGroupMessagesState.success(messages));
            }
          } catch (e) {
            emit(GetAllGroupMessagesState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatGroupRepository _chatGroupRepository;
}
