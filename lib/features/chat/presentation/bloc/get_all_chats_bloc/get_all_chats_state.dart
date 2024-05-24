part of 'get_all_chats_bloc.dart';

@freezed
class GetAllChatsState with _$GetAllChatsState {
  const factory GetAllChatsState.initial() = _Initial;
  const factory GetAllChatsState.loading() = _Loading;
  const factory GetAllChatsState.success(List<ChatRoom> chatRooms) = _Success;
  const factory GetAllChatsState.error() = _Error;
}
