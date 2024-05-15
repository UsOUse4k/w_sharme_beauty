import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/core/utils/firebase_storage_url/storage_methods.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

@LazySingleton(as: IChatGroupRepository)
class FirebaseChatGroupFacade implements IChatGroupRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;
  FirebaseChatGroupFacade(this._auth, this._firestore, this._storage);
  @override
  Future<Either<PostError, String>> createChatGroup({
    required ChatGroupRoom chatGroupRoom,
    required Uint8List file,
  }) async {
    try {
      final String groupId = const Uuid().v1();
      final user = _auth.currentUser;
      if (user == null) {
        return left(PostError('No authenticated user found'));
      }
      final String myUid = user.uid;
      final List<String> members =
          List<String>.from(chatGroupRoom.joinedUserIds ?? []);
      if (!members.contains(myUid)) {
        members.add(myUid);
      }
      members.sort((a, b) => a.compareTo(b));
      final QuerySnapshot existingChatrooms = await _firestore
          .collection('chat_groups')
          .where(
            'joinedUserIds',
            isEqualTo: members,
          )
          .get();
      final groupProfileImage = await StorageMethods(_auth, _storage)
          .uploadImageToStorage('chat_image', file, true);
      if (existingChatrooms.docs.isNotEmpty) {
        return right(existingChatrooms.docs.first.id);
      } else {
        final ChatGroupRoom groupRoom = ChatGroupRoom(
          groupId: groupId,
          lastMessage: '',
          groupProfileImage: groupProfileImage,
          lastMessageTs: Timestamp.now(),
          joinedUserIds: members,
          createdAt: Timestamp.now(),
          lastSenderId: '',
          isActive: chatGroupRoom.isActive ?? true,
          limitUsers: 200,
        );
        await _firestore
            .collection('chat_groups')
            .doc(groupId)
            .set(groupRoom.toJson());
        return right(groupId);
      }
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, String?>> sendMessage({
    required String message,
    required String groupId,
    required String receiverId,
    required String username,
    required String avatarUrl,
  }) async {
    try {
      final String messageId = const Uuid().v1();
      final String myUid = _auth.currentUser!.uid;
      //final downloadUrl = StorageMethods(_auth, _storage).uploadImageToStorage('chat_groups', , true);
      final now = Timestamp.now();
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
          _firestore.collection('chat_groups').doc(groupId);
      await myChatRoomRef
          .collection('messages')
          .doc(messageId)
          .set(newMessage.toJson());
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
  Stream<List<Message>> getMessages({required String groupId}) {
    return _firestore
        .collection('chat_groups')
        .doc(groupId)
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
  Stream<List<ChatGroupRoom>> getAllChatGroups() {
    final myUid = _auth.currentUser!.uid;
    return _firestore
        .collection('chat_groups')
        .where('joinedUserIds', arrayContains: myUid)
        .orderBy('lastMessageTs', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ChatGroupRoom.fromJson(doc.data());
      }).toList();
    });
  }

  @override
  Future<Either<PostError, ChatGroupRoom>> getGroup({
    required String groupId,
  }) async {
    try {
      final DocumentSnapshot groupDoc =
          await _firestore.collection('chat_groups').doc(groupId).get();
      if (!groupDoc.exists) {
        return left(PostError('Group not found.'));
      }
      final ChatGroupRoom groupOption =
          ChatGroupRoom.fromFirestore(groupDoc.data()! as Map<String, dynamic>);
      return right(groupOption);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Unit>> updateGroup({
    required String groupId,
    Uint8List? file,
    String? groupName,
    ChatGroupRoom? groupRoom,
  }) async {
    try {
      final updateChatGroup = _firestore.collection('chat_groups').doc(groupId);
      final Map<String, dynamic> updates = {};
      if (groupName != null) {
        updates['groupName'] = groupName;
      }
      if (file != null) {
        final groupProfileImage = await StorageMethods(_auth, _storage)
            .uploadImageToStorage('chat_image', file, true);
        updates['groupProfileImage'] = groupProfileImage;
      }
      if (groupRoom != null && groupRoom.administrator != null) {
        updates['administrator'] = groupRoom.administrator;
      }
      if (groupRoom != null && groupRoom.editors != null) {
        updates['editors'] = groupRoom.editors;
      }
      if (updates.isNotEmpty) {
        await updateChatGroup.update(updates);
      }
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
