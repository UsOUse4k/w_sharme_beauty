import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/core/utils/firebase_storage_url/storage_methods.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/profile/domain/repositories/i_profile_info_repository.dart';

@LazySingleton(as: IProfileInfoRepository)
class FirebaseProfileFacade implements IProfileInfoRepository {
  FirebaseProfileFacade(this.firestore, this.auth, this.storage);

  @override
  Future<Either<PostError, Unit>> updateInfiProfile({
    required UserProfile user,
    Uint8List? avatar,
  }) async {
    try {
      final users = firestore.collection('users').doc(user.uid);
      if (avatar != null && avatar.isNotEmpty) {
        final photoUrl = await StorageMethods(auth, storage)
            .uploadImageToStorage('users', avatar, true);
        final updateUserProfile = user.copyWith(
          profilePictureUrl: photoUrl,
        );
        await users.update(updateUserProfile.toJson());
      } else {
        await users.update(user.toJson());
      }
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;
}
