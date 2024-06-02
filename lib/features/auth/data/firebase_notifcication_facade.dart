import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_notification.dart';

@LazySingleton(as: INotification)
class FirebaseNotification implements INotification {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  FirebaseNotification(this._firestore, this._auth);
  @override
  Future<Either<PostError, NotificationModel>> createNotification({
    required String type,
    required String contentId,
    required String fromUser,
    required String userAvatarUrl,
    required String username,
    String? postImageUrl,
  }) async {
    final currentUid = _auth.currentUser!.uid;
    try {
      final notificationId = const Uuid().v1();
      final notification = NotificationModel(
        type: type,
        contentId: contentId,
        fromUser: currentUid,
        notificationId: notificationId,
        createAt: Timestamp.now(),
        toUser: fromUser,
        username: username,
        userAvatarUrl: userAvatarUrl,
        postImageUrl: postImageUrl,
      );
      await _firestore
          .collection('users')
          .doc(fromUser)
          .collection('notification')
          .doc(notificationId)
          .set(notification.toJson());
      return right(notification);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<NotificationModel>>> getAllNotification() async {
    final currentUid = _auth.currentUser!.uid;
    try {
      final QuerySnapshot querySnapshot;
      querySnapshot = await _firestore
          .collection('users')
          .doc(currentUid)
          .collection('notification')
          .get();

      final List<NotificationModel> notifications = querySnapshot.docs
          .map(
            (doc) => NotificationModel.fromJson(doc.data()! as Map<String, dynamic>),
          )
          .toList();
      return right(notifications);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
