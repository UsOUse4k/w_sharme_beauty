import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';

abstract class IAdvertRepository {
  Future<Either<AdvertFailure, Advert>> createAdvert({
    required List<File> images,
    required List<String> categories,
    required String name,
    required String description,
    required Location location,
    required String phoneNumber,
    required List<Time> schedule,
    required List<Service> services,
  });

  Future<Either<AdvertFailure, Review>> createReview({
    required String advertId,
    required int rating,
    required String comment,
  });

  Future<Either<AdvertFailure, Reply>> createReply({
    required String advertId,
    required String reviewId,
    required String comment,
  });

  Future<Either<AdvertFailure, List<Advert>>> getAdverts({
    bool onlyMy = false,
  });

  Future<Either<AdvertFailure, Advert>> getAdvert({
    required String advertId,
  });

  Future<Either<AdvertFailure, List<Review>>> getReviews({
    required String advertId,
  });

  Future<Either<AdvertFailure, List<Reply>>> getReplies({
    required String advertId,
    required String reviewId,
  });

  Future<Either<AdvertFailure, Advert>> updateAdvert({
    required String advertId,
    required List<AdvertImage> images,
    required List<String> categories,
    required String name,
    required String description,
    required Location location,
    required String phoneNumber,
    required List<Time> schedule,
    required List<Service> services,
  });

  Future<Either<AdvertFailure, Unit>> deleteAdvert({
    required String advertId,
  });
}
