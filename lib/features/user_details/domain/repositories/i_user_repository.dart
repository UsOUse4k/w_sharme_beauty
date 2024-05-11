import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';

abstract class IUserRepository {
  Future<Either<PostError, UserProfile>> getUserData({String? userId}); 
}
