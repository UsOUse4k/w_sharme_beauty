import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';

abstract class INotification {
  Future<Either <PostError, NotificationModel>> createNotification({
    required String type,
    required String contentId,
    required String fromUser,
    required String userAvatarUrl,
    required String username,
    String? postImageUrl,

  });
  Future<Either<PostError, List<NotificationModel>>> getAllNotification();
}
