import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'get_all_chat_group_event.dart';
part 'get_all_chat_group_state.dart';
part 'get_all_chat_group_bloc.freezed.dart';

@injectable
class GetAllChatGroupBloc
    extends Bloc<GetAllChatGroupEvent, GetAllChatGroupState> {
  GetAllChatGroupBloc(this._chatGroupRepository) : super(const _Initial()) {
    on<GetAllChatGroupEvent>((event, emit) async {
      await event.maybeWhen(
        getAllChatGroups: () async {
          emit(const GetAllChatGroupState.loading());
          final streamResponse = _chatGroupRepository.getAllChatGroups();
          await for(final groups in streamResponse) {
            emit(GetAllChatGroupState.success(groups));
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatGroupRepository _chatGroupRepository;
}
