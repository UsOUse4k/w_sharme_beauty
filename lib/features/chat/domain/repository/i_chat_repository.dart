import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/chat_room.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';

abstract class IChatRepository {
  Future<Either<PostError, String>> createChatRoom({
    required String uid,
    required String receiverUsername,
    required String receiverUserAvatar,
    required String senderUserAvatar,
    required String senderUsername,
  });
  Future<Either<PostError, String?>> sendMessage({
    required String message,
    required String chatRoomId,
    required String receiverId,
    required String username,
    required String avatarUrl,
    Uint8List? file,
  });
  Future<Either<PostError, String?>> sendPost({
    required String chatRoomId,
    required String receiverId,
    required Post post,
    required String username,
    required String avatarUrl,
  });
  Future<Either<PostError, String?>> seenMessage({
    required String chatRoomId,
    required String senderId,
  });
  Stream<List<Message>> getMessages({
    required String chatRoomId,
  });

  Stream<List<ChatRoom>> getAllChats();
}
