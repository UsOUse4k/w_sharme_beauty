import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';

class FirebaseAuthFacede implements IAuthFacede {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  FirebaseAuthFacede(this._firebaseAuth);

  @override
  Future<Option<User>> getSignedInUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) {
      return none();
    } else {
      return some(
        User(
          uid: firebaseUser.uid,
          email: firebaseUser.email!,
          name: firebaseUser.displayName ?? '',
          profilePictureUrl: firebaseUser.photoURL ?? '',
        ),
      );
    }
  }

  @override
  Future<AuthFacedeResult> loginWithEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<AuthFacedeResult> registerWithEmail(
      String email, String password,) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<AuthFacedeResult> logout() async {
    try {
      await _firebaseAuth.signOut();
      return right(unit);
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }
  
  @override
  Future<AuthFacedeResult> saveDataUser() {
    throw UnimplementedError();
  }
}
