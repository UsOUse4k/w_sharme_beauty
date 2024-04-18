import 'package:cloud_firestore/cloud_firestore.dart' as firebase_store;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';

class FirebaseAuthFacede implements IAuthFacede {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final firebase_store.FirebaseFirestore _store;
  FirebaseAuthFacede(this._firebaseAuth, this._store);

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
  Future<Either<AuthFailure, String>> registerWithEmail(
    String email,
    String password,
  ) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userId = result.user?.uid; // Получаем UID
      if (userId != null) {
        return right(userId);
      } else {
        return left(const AuthFailure.serverError());
      }
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
  Future<AuthFacedeResult> saveDataUser(
    String name,
    String city,
    String username,
    String userId,
  ) async {
    try {
      final CollectionReference user = _store.collection('users');
      await user.doc(userId).set({
        'name': name,
        'city': city,
        'username': username,
      });
      
      return right(unit);
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }
}
