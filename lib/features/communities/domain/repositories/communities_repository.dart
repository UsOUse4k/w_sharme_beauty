import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/communities.dart';

abstract class CommunitiesRepository {
  Future<Either<PostError, Unit>> communities(Communities communities);
}
