import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community.dart';

abstract class ICommunityRepository {
  Future<Either<PostError, List<Community>>> communitiesList({
    String? userId,
  });
  Future<Either<PostError, Unit>> createCommunity(
    Community community,
    Uint8List avatar,
    String userId,
  );
  Future<Either<PostError, Unit>> deleteCommunity(Community community);
  Future<Either<PostError, Unit>> updateCommunity({
    required String communityName,
    required String desc,
    required String category,
    Uint8List? file,
    required String communityId,
  });
  Future<Either<PostError, Community>> getDetail({
    String? communityId,
  });
  Future<Either<PostError, Unit>> subscribeCommunity ({
    required String communityId,
    required String targetUid,
    required String chatGroupId,
  });
  Future<Either<PostError, Unit>> unsubscribeCommunity({
    required String communityId,
    required String targetUid,
    required String chatGroupId,
  });
}
