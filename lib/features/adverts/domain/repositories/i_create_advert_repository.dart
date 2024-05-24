import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/adverts/domain/entities/entities.dart';

abstract class ICreateAdvartRepository {
  Future<Either<PostError, Unit>> createAdvert(
    CreateAdvert createAdvert,
    List<Uint8List> imageFiles,
    String saloonName,
    String? avatarUrl,
  );
  Future<Either<PostError, List<CreateAdvert>>> getCreateAdverts({
    String? userId,
  });
  Future<Either<PostError, Unit>> updateLikes(
    String advertId,
    String authorId,
    bool add,
  );
  Future<Either<PostError, CreateAdvert>> getCreateAdvert(
    String advertId,
    String? userId,
  );
}
