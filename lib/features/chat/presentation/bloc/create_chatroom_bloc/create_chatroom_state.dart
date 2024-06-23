part of 'create_chatroom_bloc.dart';

@freezed
class CreateChatroomState with _$CreateChatroomState {
  const factory CreateChatroomState.initial() = _Initial;
  const factory CreateChatroomState.sucsess({String? chatRoomId, String? userId}) = _Success;
  const factory CreateChatroomState.loading() = _Loading;
  const factory CreateChatroomState.error({required String errorMessage}) = _Error;
}
