import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert_failure.dart';
import 'package:w_sharme_beauty/features/adverts/domain/i_advert_repository.dart';

@LazySingleton(as: IAdvertRepository)
class FirebaseAdvertRepository implements IAdvertRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  FirebaseAdvertRepository(this._auth, this._firestore, this._storage);

  @override
  Future<Either<AdvertFailure, Advert>> createAdvert({
    required List<File> images,
    required List<String> categories,
    required String name,
    required String description,
    required Location location,
    required String phoneNumber,
    required List<Time> schedule,
    required List<Service> services,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        return left(const AdvertFailure.userNotSignedIn());
      }

      final batch = _firestore.batch();

      final docRef = _firestore.collection('adverts').doc();

      batch.set(docRef, {
        "userId": user.uid,
        "categories": categories,
        "name": name,
        "description": description,
        "location": location.toFirestore(),
        "phoneNumber": phoneNumber,
        "schedule": schedule.map((e) => e.toJson()).toList(),
        "services": services.map((e) => e.toJson()).toList(),
        "reviewsCount": 0,
        "rating": 0.0,
        "createdAt": Timestamp.now(),
      });

      final storageRef = _storage.ref("adverts");
      final List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        final imageRef = storageRef.child('${docRef.id}/$i.png');
        final snapshot = await imageRef.putFile(images[i]);
        final imageUrl = await snapshot.ref.getDownloadURL();
        imageUrls.add(imageUrl);
      }

      batch.update(docRef, {"images": imageUrls});

      await batch.commit();

      final doc = await docRef.get();

      return right(Advert.fromFirestore(doc));
    } catch (e, s) {
      print("$e\n$s");

      return left(const AdvertFailure.serverError());
    }
  }

  @override
  Future<Either<AdvertFailure, List<Advert>>> getAdverts({
    bool onlyMy = false,
  }) async {
    try {
      QuerySnapshot querySnapshot;

      final userId = _auth.currentUser?.uid;

      if (userId == null) {
        return left(const AdvertFailure.userNotSignedIn());
      }

      if (onlyMy) {
        querySnapshot = await _firestore
            .collection('adverts')
            .where('userId', isEqualTo: userId)
            .get();
      } else {
        querySnapshot = await _firestore
            .collection('adverts')
            .where('userId', isNotEqualTo: userId)
            .get();
      }

      final adverts =
          querySnapshot.docs.map((doc) => Advert.fromFirestore(doc)).toList();

      return right(adverts);
    } catch (e, s) {
      print("$e\n$s");

      return left(const AdvertFailure.serverError());
    }
  }
  
  @override
  Future<Either<AdvertFailure, Advert>> getAdvert({required String advertId}) {
    // TODO: implement getAdvert
    throw UnimplementedError();
  }

  @override
  Future<Either<AdvertFailure, Review>> createReview({
    required String advertId,
    required int rating,
    required String comment,
  }) async {
    try {
      final userId = _auth.currentUser?.uid;

      if (userId == null) {
        return left(const AdvertFailure.userNotSignedIn());
      }

      final batch = _firestore.batch();

      final userDocRef = _firestore.collection("users").doc(userId);
      final userDoc = await userDocRef.get();
      final userData = userDoc.data()!;

      final userProfileImage = userData["profilePictureUrl"] as String?;
      final userFullName = userData["name"] as String;
      final userReviewsCount = userData["userReviewsCount"] as int? ?? 0;
      final updatedUserReviewsCount = userReviewsCount + 1;

      batch.update(userDocRef, {"userReviewsCount": updatedUserReviewsCount});

      final advertDocRef = _firestore.collection('adverts').doc(advertId);
      final advertDoc = await advertDocRef.get();
      final advert = Advert.fromFirestore(advertDoc);

      final updatedReviewsCount = advert.reviewsCount + 1;
      final updatedRating = ((advert.rating + rating) / updatedReviewsCount)
          .roundToDecimalPlaces(1);

      batch.update(advertDocRef, {
        "reviewsCount": updatedReviewsCount,
        "rating": updatedRating,
      });

      final reviewsDocRef = await advertDocRef.collection("reviews").add({
        "userId": userId,
        "userProfileImage": userProfileImage,
        "userFullName": userFullName,
        "userReviewsCount": updatedUserReviewsCount,
        "rating": rating,
        "comment": comment,
        "likes": 0,
        "repliesCount": 0,
        "createdAt": Timestamp.now(),
      });

      final reviewDoc = await reviewsDocRef.get();

      final review = Review.fromFirestore(reviewDoc);

      await batch.commit();

      return right(review);
    } catch (e, s) {
      print("$e\n$s");

      return left(const AdvertFailure.serverError());
    }
  }

  @override
  Future<Either<AdvertFailure, Reply>> createReply({
    required String advertId,
    required String reviewId,
    required String comment,
  }) async {
    try {
      final userId = _auth.currentUser?.uid;

      if (userId == null) {
        return left(const AdvertFailure.userNotSignedIn());
      }

      final userDocRef = _firestore.collection("users").doc(userId);
      final userDoc = await userDocRef.get();
      final userData = userDoc.data()!;

      final userProfileImage = userData["profilePictureUrl"] as String?;
      final userFullName = userData["name"] as String;

      final batch = _firestore.batch();

      final reviewDocRef = _firestore
          .collection('adverts')
          .doc(advertId)
          .collection("reviews")
          .doc(reviewId);

      final reviewDoc = await reviewDocRef.get();
      final reviewData = reviewDoc.data()!;
      final repliesCount = reviewData["repliesCount"] as int;
      final updatedRepliesCount = repliesCount + 1;

      batch.update(reviewDocRef, {"repliesCount": updatedRepliesCount});

      final replyDocRef = await reviewDocRef.collection("replies").add({
        "userId": userId,
        "userProfileImage": userProfileImage,
        "userFullName": userFullName,
        "comment": comment,
        "createdAt": Timestamp.now(),
      });

      final replyDoc = await replyDocRef.get();

      final reply = Reply.fromFirestore(replyDoc);

      await batch.commit();

      return right(reply);
    } catch (e, s) {
      print("$e\n$s");

      return left(const AdvertFailure.serverError());
    }
  }

  @override
  Future<Either<AdvertFailure, List<Review>>> getReviews({
    required String advertId,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection('adverts')
          .doc(advertId)
          .collection("reviews")
          .get();

      final reviews =
          querySnapshot.docs.map((doc) => Review.fromFirestore(doc)).toList();

      return right(reviews);
    } catch (e, s) {
      print("$e\n$s");

      return left(const AdvertFailure.serverError());
    }
  }

  @override
  Future<Either<AdvertFailure, List<Reply>>> getReplies({
    required String advertId,
    required String reviewId,
  }) async {
    try {
      final querySnapshot = await _firestore
          .collection('adverts')
          .doc(advertId)
          .collection("reviews")
          .doc(reviewId)
          .collection("replies")
          .get();

      final replies =
          querySnapshot.docs.map((doc) => Reply.fromFirestore(doc)).toList();

      return right(replies);
    } catch (e, s) {
      print("$e\n$s");

      return left(const AdvertFailure.serverError());
    }
  }

  @override
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
  }) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        return left(const AdvertFailure.userNotSignedIn());
      }

      final batch = _firestore.batch();

      final docRef = _firestore.collection('adverts').doc(advertId);
      final doc = await docRef.get();

      if (!doc.exists) {
        return left(const AdvertFailure.notExists());
      }

      batch.update(docRef, {
        "categories": categories,
        "name": name,
        "description": description,
        "location": location.toFirestore(),
        "phoneNumber": phoneNumber,
        "schedule": schedule.map((e) => e.toJson()).toList(),
        "services": services.map((e) => e.toJson()).toList(),
      });

      final storageRef = _storage.ref("adverts");

      final List<String> newImageUrls = [];
      final List<String> existingImageUrls = images
          .where((img) => img.url != null)
          .map((img) => img.url!)
          .toList();

      for (int i = 0; i < images.length; i++) {
        final imageFile = images[i].file;

        if (imageFile != null) {
          final imageRef = storageRef.child('${docRef.id}/$i.png');
          final snapshot = await imageRef.putFile(imageFile);
          final imageUrl = await snapshot.ref.getDownloadURL();
          newImageUrls.add(imageUrl);
        }
      }

      final updatedImages = existingImageUrls + newImageUrls;

      batch.update(docRef, {"images": updatedImages});

      await batch.commit();

      final updatedDoc = await docRef.get();

      return right(Advert.fromFirestore(updatedDoc));
    } catch (e, s) {
      print("$e\n$s");

      return left(const AdvertFailure.serverError());
    }
  }

  @override
  Future<Either<AdvertFailure, Unit>> deleteAdvert({
    required String advertId,
  }) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        return left(const AdvertFailure.userNotSignedIn());
      }

      final docRef = _firestore.collection('adverts').doc(advertId);
      final doc = await docRef.get();

      if (!doc.exists) {
        return left(const AdvertFailure.notExists());
      }

      final advert = Advert.fromFirestore(doc);
      final List<String> imageUrls = advert.images;

      for (final imageUrl in imageUrls) {
        final imageRef = _storage.refFromURL(imageUrl);
        await imageRef.delete();
      }

      await docRef.delete();

      return right(unit);
    } catch (e, s) {
      print("$e\n$s");
      return left(const AdvertFailure.serverError());
    }
  }
}

extension DoubleRounding on double {
  double roundToDecimalPlaces(int places) {
    return double.parse(toStringAsFixed(places));
  }
}
