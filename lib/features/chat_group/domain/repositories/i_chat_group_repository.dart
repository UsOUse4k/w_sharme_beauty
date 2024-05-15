import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';

abstract class IChatGroupRepository {
  Future<Either<PostError, String>> createChatGroup({
    required ChatGroupRoom chatGroupRoom,
    required Uint8List file,
  });
  Future<Either<PostError, String?>> sendMessage({
    required String message,
    required String groupId,
    required String receiverId,
    required String username,
    required String avatarUrl,
  });

  Stream<List<Message>> getMessages({
    required String groupId,
  });
  Stream<List<ChatGroupRoom>> getAllChatGroups();
  Future<Either<PostError, ChatGroupRoom>> getGroup({
    required String groupId,
  });
  Future<Either<PostError, Unit>> updateGroup({
    required String groupId,
    Uint8List? file,
    String? groupName,
    ChatGroupRoom? groupRoom,
  });
}
