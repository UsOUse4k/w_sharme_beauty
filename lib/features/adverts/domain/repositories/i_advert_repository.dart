import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/adverts/domain/entities/entities.dart';

abstract class IAdvartRepository {
  Future<Either<PostError, Unit>> createAdvert(
    Advert createAdvert,
    List<Uint8List> imageFiles,
    String saloonName,
    String? avatarUrl,
  );
  Future<Either<PostError, List<Advert>>> getCreateAdverts({
    String? userId,
  });
  Future<Either<PostError, Unit>> updateLikes(
    String advertId,
    String authorId,
    bool add,
  );
  Future<Either<PostError, Advert>> getCreateAdvert(
    String advertId,
    String? userId,
  );
}
