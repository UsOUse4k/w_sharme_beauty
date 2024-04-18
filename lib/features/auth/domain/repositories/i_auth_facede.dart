import 'package:dartz/dartz.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';

typedef AuthFacedeResult = Either<AuthFailure, Unit>;

abstract class IAuthFacede {
  Future<Option<User>> getSignedInUser();
  Future<AuthFacedeResult> loginWithEmail(
    String email,
    String password,
  );
  Future<Either<AuthFailure, String>> registerWithEmail(
    String email,
    String password,
  );
  Future<AuthFacedeResult> logout();
  Future<AuthFacedeResult> saveDataUser(
    String name,
    String city,
    String username,
    String userId,
  );

  Future<AuthFacedeResult> resetPassword(
    String email,
  );
}
