import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';
import 'package:w_sharme_beauty/features/user_details/domain/repositories/i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class FirebaseUserFacade implements IUserRepository {
  FirebaseUserFacade(this.firestore, this.auth, this.storage);
  @override
  Future<Either<PostError, UserProfile>> getUserData({String? userId}) async {
    try {
      if (userId == null) {
        return left(
          PostError('No user id provided and no authenticated user.'),
        );
      }
      final DocumentSnapshot userDoc =
          await firestore.collection('users').doc(userId).get();
      if (!userDoc.exists) {
        return left(PostError('User not found.'));
      }
      final UserProfile userProfile =
          UserProfile.fromFirestore(userDoc.data()! as Map<String, dynamic>);
      return right(userProfile);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;
}
