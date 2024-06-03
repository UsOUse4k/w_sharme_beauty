import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';

abstract class IChatGroupRepository {
  Future<Either<PostError, String>> createChatGroup({
    required ChatGroupRoom chatGroupRoom,
    required Uint8List file,
    required String communityId,
  });
  Future<Either<PostError, String?>> sendMessage({
    required String message,
    required String groupId,
    required String receiverId,
    required String username,
    required String avatarUrl,
    required String communityId,
    Uint8List? file,
  });

  Stream<List<Message>> getMessages({
    required String groupId,
    required String communityId,
  });
  Stream<List<ChatGroupRoom>> getAllChatGroup({
    required String communityId,
  });
  Future<Either<PostError, ChatGroupRoom>> getGroup({
    required String groupId,
    required String communityId,
  });
  Future<Either<PostError, Unit>> updateGroup({
    required String groupId,
    Uint8List? file,
    String? groupName,
    ChatGroupRoom? groupRoom,
    required String communityId,
  });
  Future<Either<PostError, Unit>> removeAdminAndUserChatGroup({
    required String groupId,
    required String userId,
    required String type,
    required String communityId,
  });
  Future<Either<PostError, Unit>> addedUserChatGroup({
    required String groupId,
    required List<String> userIds,
    required String communityId,
  });
}
