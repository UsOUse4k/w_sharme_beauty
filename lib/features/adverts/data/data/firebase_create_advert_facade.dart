import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/core/utils/format_date/date_formatter.dart';
import 'package:w_sharme_beauty/features/adverts/domain/entities/create_advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/repositories/i_create_advert_repository.dart';
import 'package:w_sharme_beauty/features/post/data/firebase_storage_image_methods.dart';

@LazySingleton(as: ICreateAdvartRepository)
class FirebaseCreateAdvartRepository implements ICreateAdvartRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  FirebaseCreateAdvartRepository(
    this.auth,
    this.firestore,
    this.storage,
  );
  @override
  Future<Either<PostError, Unit>> createAdvert(
    CreateAdvert createAdvert,
    List<Uint8List> imageFiles,
    String saloonName,
    String? avatarUrl,
  ) async {
    try {
      final String advertId = const Uuid().v1();
      final String authorId = auth.currentUser!.uid;
      final DateTime now = DateTime.now();
      final String formattedDate = DateFormatter.format(now);
      final List<String> imageUrls =
          await FirebaseStorageImageMethods(auth, storage)
              .uploadImageToStorage(imageFiles, true, 'adverts');
      final updatedCreateAdvert = createAdvert.copyWith(
        advertId: advertId,
        authorId: authorId,
        createdAt: formattedDate,
        imageUrls: imageUrls,
        sloonName: saloonName,
        avatarUrl: avatarUrl,
      );
      await firestore
          .collection('adverts')
          .doc(advertId)
          .set(updatedCreateAdvert.toJson());
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<CreateAdvert>>> getCreateAdverts({
    String? userId,
  }) async {
    try {
      late final QuerySnapshot querySnapshot;
      if (userId != null) {
        querySnapshot = await firestore
            .collection('adverts')
            .where('authorId', isEqualTo: userId)
            .get();
      } else {
        querySnapshot = await firestore.collection('adverts').get();
      }
      if (querySnapshot.docs.isNotEmpty) {
        final List<CreateAdvert> createAdverts = querySnapshot.docs
            .map(
              (e) => CreateAdvert.fromJson(e.data()! as Map<String, dynamic>),
            )
            .toList();
        return right(createAdverts);
      } else {
        return left(PostError('no data'));
      }
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Unit>> updateLikes(
    String advertId,
    String authorId,
    bool add,
  ) async {
    try {
      await firestore.collection('adverts').doc(advertId).update({
        'likes': add
            ? FieldValue.arrayUnion([authorId])
            : FieldValue.arrayRemove([authorId]),
      });
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, CreateAdvert>> getCreateAdvert(
    String? advertId,
    String? userId,
  ) async {
    try {
      if (advertId == null) {
        return left(PostError('no Advert id'));
      }
      final DocumentSnapshot advert =
          await firestore.collection('adverts').doc(advertId).get();
      if (!advert.exists) {
        return left(PostError('Advert not found.'));
      }
      final CreateAdvert userProfile = CreateAdvert.fromStoreData(
        advert.data()! as Map<String, dynamic>,
      );
      return right(userProfile);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
