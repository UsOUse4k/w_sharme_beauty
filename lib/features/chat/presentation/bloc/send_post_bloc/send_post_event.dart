part of 'send_post_bloc.dart';

@freezed
class SendPostEvent with _$SendPostEvent {
  const factory SendPostEvent.sendPost({
    required String chatRoomId,
    required String receiverId,
    required Post post,
  }) = _SendPost;
}
