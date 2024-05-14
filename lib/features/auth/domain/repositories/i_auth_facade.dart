import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';

typedef AuthFacadeResult = Either<AuthFailure, Unit>;

abstract class IAuthFacade {
  Future<Option<UserProfile>> getSignedInUser();
  Future<AuthFacadeResult> loginWithEmail(
    String email,
    String password,
  );
  Future<Either<AuthFailure, String>> registerWithEmail(
    String email,
    String password,
  );
  Future<AuthFacadeResult> logout();
  Future<AuthFacadeResult> saveDataUser(
    String name,
    String city,
    String username,
    String userId,
  );
  Future<AuthFacadeResult> resetPassword(
    String email,
  );
  Future<void> updateStatusUser();
  Future<Either<PostError, List<UserProfile>>> getAllUsers();
  Future<Either<PostError, UserProfile>> getMeInfo(String? userId);
  Future<List<UserProfile>> getUserProfiles({
    required List<String> userIds,
  });
}
