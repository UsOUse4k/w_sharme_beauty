import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community.dart';

abstract class ICommunitiesRepository {
  Future<Either<PostError, List<Community>>> communitiesList(
    List<Community> community,
  );
  Future<Either<PostError, Unit>> addCommunity(Community community);
  Future<Either<PostError, Unit>> deleteCommunity(Community community);
  Future<Either<PostError, Unit>> updateCommunity(Community community);
}
