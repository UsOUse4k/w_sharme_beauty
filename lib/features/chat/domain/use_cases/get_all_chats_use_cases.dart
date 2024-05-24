import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/chat_room.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';

@injectable
class GetAllChatsUseCase {
  final IChatRepository _chatRepository;
  GetAllChatsUseCase(this._chatRepository);

  Stream<List<ChatRoom>> call() {
    return _chatRepository.getAllChats();
  }
}
