import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/core/utils/firebase_storage_url/storage_methods.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/chat_room.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';
import 'package:w_sharme_beauty/features/chat/domain/repository/i_chat_repository.dart';

@LazySingleton(as: IChatRepository)
class FirebaseChatFacade implements IChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;
  FirebaseChatFacade(this.auth, this.firestore, this.storage);

  @override
  Future<Either<PostError, String>> createChatRoom({
    required String uid,
  }) async {
    try {
      final String myUid = auth.currentUser!.uid;
      final CollectionReference chatrooms = firestore.collection('chatrooms');
      final sortedMembers = [myUid, uid]..sort((a, b) => a.compareTo(b));
      final QuerySnapshot existingChatrooms = await chatrooms
          .where(
            'members',
            isEqualTo: sortedMembers,
          )
          .get();
      if (existingChatrooms.docs.isNotEmpty) {
        return right(existingChatrooms.docs.first.id);
      } else {
        final chatRoomId = const Uuid().v1();
        final now = Timestamp.now();
        final ChatRoom chatroom = ChatRoom(
          chatRoomId: chatRoomId,
          lastMessage: '',
          lastMessageTs: now,
          members: sortedMembers,
          createdAt: now,
          lastSenderId: '',
        );
        await firestore
            .collection('chatrooms')
            .doc(chatRoomId)
            .set(chatroom.toJson());
        return right(chatRoomId);
      }
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, String?>> seenMessage({
    required String chatRoomId,
    required String senderId,
  }) async {
    try {
      final messagesQuery = await firestore
          .collection('chatrooms')
          .doc(chatRoomId)
          .collection('messages')
          .where('senderId', isEqualTo: senderId)
          .where('seen', isEqualTo: false)
          .get();
      if (messagesQuery.docs.isEmpty) {
        return right(null);
      }
      final batch = firestore.batch();
      for (final doc in messagesQuery.docs) {
        batch.update(doc.reference, {'seen': true});
      }
      await batch.commit();

      await firestore
          .collection('chatrooms')
          .doc(chatRoomId)
          .update({'messageCount': 0, 'seen': true});

      return right(null);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, String>> sendFileMessage({
    required String chatRoomId,
    required String messageType,
    required Uint8List file,
    required String receiverId,
  }) async {
    try {
      final messageId = const Uuid().v1();
      final now = Timestamp.now();
      final String myUid = auth.currentUser!.uid;
      final downloadUrl = await StorageMethods(auth, storage)
          .uploadImageToStorage('messages', file, true);
      final Message newMessage = Message(
        message: downloadUrl,
        messageId: messageId,
        senderId: myUid,
        receiverId: receiverId,
        timestamp: now,
        seen: false,
        messageType: 'text',
      );
      final DocumentReference myChatRoomRef =
          firestore.collection('chatrooms').doc(chatRoomId);

      await myChatRoomRef
          .collection('messages')
          .doc(messageId)
          .set(newMessage.toJson());

      if (myUid != receiverId) {
        await myChatRoomRef.update({
          'messageCount': FieldValue.increment(1),
          'lastMessage': downloadUrl,
          'lastMessageTs': now,
          'seen': false,
          'lastSenderId': myUid,
        });
      }
      return right('');
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, String?>> sendMessage({
    required String message,
    required String chatRoomId,
    required String receiverId,
    required String username,
    required String avatarUrl,
    Uint8List? file,
  }) async {
    try {
      final messageId = const Uuid().v1();
      final now = Timestamp.now();
      final String myUid = auth.currentUser!.uid;

      final Message newMessage = Message(
        message: message,
        messageId: messageId,
        senderId: myUid,
        receiverId: receiverId,
        timestamp: now,
        seen: false,
        messageType: 'text',
        avatarUrl: avatarUrl,
        username: username,
      );
      final DocumentReference myChatRoomRef =
          firestore.collection('chatrooms').doc(chatRoomId);
      if (file != null) {
        final imageurl = await StorageMethods(auth, storage)
            .uploadImageToStorage('chatrooms', file, true);
        final updateMessage = newMessage.copyWith(
          image: imageurl,
        );
        await myChatRoomRef
            .collection('messages')
            .doc(messageId)
            .set(updateMessage.toJson());
      } else {
        await myChatRoomRef
            .collection('messages')
            .doc(messageId)
            .set(newMessage.toJson());
      }

      if (myUid != receiverId) {
        await myChatRoomRef.update({
          'messageCount': FieldValue.increment(1),
          'lastMessage': message,
          'lastMessageTs': now,
          'seen': false,
          'lastSenderId': myUid,
        });
      }
      return right(null);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Stream<List<Message>> getMessages({required String chatRoomId}) {
    return firestore
        .collection('chatrooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Message.fromJson(doc.data());
      }).toList();
    });
  }

  @override
  Stream<List<ChatRoom>> getAllChats() {
    final myUid = auth.currentUser!.uid;
    return firestore
        .collection('chatrooms')
        .where('members', arrayContains: myUid)
        .orderBy('lastMessageTs', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatRoom.fromJson(doc.data());
      }).toList();
    });
  }
}
