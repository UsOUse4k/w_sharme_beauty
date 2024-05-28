import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';

abstract class IProfileInfoRepository {
  Future<Either<PostError, Unit>> updateInfiProfile({
    required UserProfile user,
    Uint8List? avatar,
  });
  Future<Either<PostError, Unit>> updateNewEmail({
    required String email,
  });
}
