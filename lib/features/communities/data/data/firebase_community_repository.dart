import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/core/utils/date_formatter.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community.dart';
import 'package:w_sharme_beauty/features/communities/domain/repositories/i_community_repository.dart';
import 'package:w_sharme_beauty/features/profile/data/data/storage_methods.dart';

@LazySingleton(as: ICommunityRepository)
class FirestoreCommunityRepository implements ICommunityRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;
  FirestoreCommunityRepository(this.firestore, this.auth, this.storage);

  @override
  Future<Either<PostError, Unit>> createCommunity(
      Community community, Uint8List avatar, String userId) async {
    try {
      final String communityId = const Uuid().v1();
      final DateTime now = DateTime.now();
      final String formattedDate = DateFormatter.format(now);
      final avatarUrl = await StorageMethods(auth, storage)
          .uploadImageToStorage("communities", avatar, true);
      final updatedCommunity = community.copyWith(
        uid: userId,
        communityId: communityId,
        avatarUrls: avatarUrl,
        description: community.description,
        communityName: community.communityName,
        createdAt: formattedDate,
      );
      await firestore.collection('communities').doc(communityId).set(
            updatedCommunity.toJson(),
          );
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Unit>> deleteCommunity(Community community) async {
    try {
      await firestore
          .collection('communities')
          .doc(community.communityId)
          .delete();
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, Unit>> updateCommunity(Community community) async {
    try {
      await firestore
          .collection('communities')
          .doc(community.communityId)
          .update(community.toJson());
      return right(unit);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, List<Community>>> communitiesList(
    List<Community> community,
  ) async {
    try {
      return right(community);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
