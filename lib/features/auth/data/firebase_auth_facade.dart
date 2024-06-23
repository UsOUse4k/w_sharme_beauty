import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/core/errors/errors.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/subscribe_result.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/repositories.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _store;
  final FirebaseFirestore _firestore;

  FirebaseAuthFacade(this._firebaseAuth, this._store, this._firestore);

  @override
  Future<Option<UserProfile>> getSignedInUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) {
      return none();
    } else {
      return some(
        UserProfile(
          uid: firebaseUser.uid,
          email: firebaseUser.email,
          name: firebaseUser.displayName,
          profilePictureUrl: firebaseUser.photoURL,
        ),
      );
    }
  }

  @override
  Future<AuthFacadeResult> loginWithEmail(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email' || e.code == 'invalid-credential') {
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
    } on FirebaseAuthException catch (e) {
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
  Future<AuthFacadeResult> logout() async {
    try {
      await _firebaseAuth.signOut();
      return right(unit);
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<AuthFacadeResult> saveDataUser(
    String name,
    String city,
    String username,
    String userId,
  ) async {
    try {
      final users = _store.collection('users');
      await users.doc(userId).set({
        'name': name,
        'city': city,
        'username': username,
        'uid': userId,
      });
      return right(unit);
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<AuthFacadeResult> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(const AuthFailure.emailInvalid());
      } else {
        return left(const AuthFailure.serverError());
      }
    } catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> updateStatusUser() async {
    final uid = _firebaseAuth.currentUser!.uid;
    await _firestore.collection('users').doc(uid).update({
      'lastSeen': Timestamp.now(),
    });
  }

  @override
  Future<Either<PostError, List<UserProfile>>> getAllUsers() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('users').get();
      final List<UserProfile> users = querySnapshot.docs
          .map((doc) {
            final data = doc.data()! as Map<String, dynamic>;

            if (data.containsKey('uid') && data['uid'] != null) {
              return UserProfile.fromJson(data);
            } else {
              return null;
            }
          })
          .where((user) => user != null)
          .cast<UserProfile>()
          .toList();
      return right(users);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, UserProfile>> getMeInfo(String? userId) async {
    try {
      final effectiveUserId = userId ?? _firebaseAuth.currentUser?.uid;
      if (effectiveUserId == null) {
        return left(
          PostError('No user id provided and no authenticated user.'),
        );
      }
      final DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(effectiveUserId).get();
      if (!userDoc.exists) {
        return left(PostError('User not found.'));
      }
      final UserProfile userProfile =
          UserProfile.fromStoreData(userDoc.data()! as Map<String, dynamic>);
      return right(userProfile);
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<List<UserProfile>> getUserProfiles({
    required List<String> userIds,
  }) async {
    try {
      final List<UserProfile> profiles = [];
      for (final String userId in userIds) {
        final snapshot = await _firestore.collection('users').doc(userId).get();
        final data = snapshot.data();
        if (data != null) {
          profiles.add(UserProfile.fromStoreData(data));
        }
      }
      return profiles;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Either<PostError, SubscriptionResult>> subscribe({
    required String targetUserUid,
  }) async {
    final currentUid = _firebaseAuth.currentUser!.uid;
    try {
      final DocumentReference<Map<String, dynamic>> currentUserDoc = _firestore
          .collection('users')
          .doc(currentUid)
          .withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) => snapshot.data()!,
            toFirestore: (value, _) => value,
          );
      final DocumentReference<Map<String, dynamic>> targetUserDoc = _firestore
          .collection('users')
          .doc(targetUserUid)
          .withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) => snapshot.data()!,
            toFirestore: (value, _) => value,
          );

      await _firestore.runTransaction(
        (transaction) async {
          final DocumentSnapshot<Map<String, dynamic>> currentUserSnapshot =
              await transaction.get(currentUserDoc);
          final DocumentSnapshot<Map<String, dynamic>> targetUserSnapshot =
              await transaction.get(targetUserDoc);
          final List<dynamic> currentUserSubscriptions = (currentUserSnapshot
                  .data()?['subscriptions'] as List<dynamic>?) ??
              [];
          final List<dynamic> targetUserFollowers =
              (targetUserSnapshot.data()?['followers'] as List<dynamic>?) ?? [];

          if (!currentUserSubscriptions.contains(targetUserUid)) {
            currentUserSubscriptions.add(targetUserUid);
            transaction.update(
              currentUserDoc,
              {'subscriptions': currentUserSubscriptions},
            );
          }

          if (!targetUserFollowers.contains(currentUid)) {
            targetUserFollowers.add(currentUid);
            transaction.update(
              targetUserDoc,
              {'followers': targetUserFollowers},
            );
          }
          final querySnapshot = await _firestore
              .collection('posts')
              .where('authorId', isEqualTo: targetUserUid)
              .get();
          for (final doc in querySnapshot.docs) {
            final List<dynamic> postFollowers =
                doc.data()['followers'] as List<dynamic>? ?? [];
            if (!postFollowers.contains(currentUid)) {
              postFollowers.add(currentUid);
              transaction.update(doc.reference, {'followers': postFollowers});
            }
          }
        },
      );
      return right(SubscriptionResult(isSubscribed: true));
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }

  @override
  Future<Either<PostError, SubscriptionResult>> unsubscribe({
    required String targetUserUid,
  }) async {
    final currentUid = _firebaseAuth.currentUser!.uid;
    try {
      final DocumentReference<Map<String, dynamic>> currentUserDoc = _firestore
          .collection('users')
          .doc(currentUid)
          .withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) => snapshot.data()!,
            toFirestore: (value, _) => value,
          );
      final DocumentReference<Map<String, dynamic>> targetUserDoc = _firestore
          .collection('users')
          .doc(targetUserUid)
          .withConverter<Map<String, dynamic>>(
            fromFirestore: (snapshot, _) => snapshot.data()!,
            toFirestore: (value, _) => value,
          );

      await _firestore.runTransaction(
        (transaction) async {
          final DocumentSnapshot<Map<String, dynamic>> currentUserSnapshot =
              await transaction.get(currentUserDoc);
          final DocumentSnapshot<Map<String, dynamic>> targetUserSnapshot =
              await transaction.get(targetUserDoc);

          final List<dynamic> currentUserSubscriptions = (currentUserSnapshot
                  .data()?['subscriptions'] as List<dynamic>?) ??
              [];
          final List<dynamic> targetUserFollowers =
              (targetUserSnapshot.data()?['followers'] as List<dynamic>?) ?? [];
          currentUserSubscriptions.remove(targetUserUid);
          targetUserFollowers.remove(currentUid);
          transaction.update(
            currentUserDoc,
            {'subscriptions': currentUserSubscriptions},
          );
          transaction.update(
            targetUserDoc,
            {'followers': targetUserFollowers},
          );
          final querySnapshot = await _firestore
              .collection('posts')
              .where('authorId', isEqualTo: targetUserUid)
              .get();
          for (final doc in querySnapshot.docs) {
            final List<dynamic> postFollowers =
                doc.data()['followers'] as List<dynamic>? ?? [];
            if (postFollowers.contains(currentUid)) {
              postFollowers.remove(currentUid);
              transaction.update(doc.reference, {'followers': postFollowers});
            }
          }
        },
      );
      return right(SubscriptionResult(isSubscribed: false));
    } catch (e) {
      return left(PostError(e.toString()));
    }
  }
}
