import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert.freezed.dart';
part 'advert.g.dart';

class AdvertImage {
  final File? file;
  final String? url;

  AdvertImage({
    this.file,
    this.url,
  });
}

@freezed
class Advert with _$Advert {
  const Advert._();

  const factory Advert({
    required String id,
    required String userId,
    required List<String> images,
    required List<String> categories,
    required String name,
    required String description,
    required Location location,
    required String phoneNumber,
    required List<Time> schedule,
    required List<Service> services,
    required int reviewsCount,
    required double rating,
    required DateTime createdAt,
  }) = _Advert;

  factory Advert.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;

    return Advert(
      id: doc.id,
      userId: data['userId'] as String,
      images: List<String>.from(data['images'] as List),
      categories: List<String>.from(data['categories'] as List),
      name: data['name'] as String,
      description: data['description'] as String,
      location:
          Location.fromFirestore(data['location'] as Map<String, dynamic>),
      phoneNumber: data['phoneNumber'] as String,
      schedule: (data['schedule'] as List)
          .map((e) => Time.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: (data['services'] as List)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviewsCount: data['reviewsCount'] as int,
      rating: (data['rating'] as num).toDouble(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}

@freezed
class Location with _$Location {
  const Location._();

  const factory Location({
    required String address,
    required String formattedAddress,
    required (double, double) coordinates,
  }) = _Location;

  factory Location.fromFirestore(Map<String, dynamic> data) {
    final coordinates = data['coordinates'] as GeoPoint;
    return Location(
      address: data['address'] as String,
      formattedAddress: data['formattedAddress'] as String,
      coordinates: (
        coordinates.latitude,
        coordinates.longitude,
      ),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'address': address,
      'formattedAddress': formattedAddress,
      'coordinates': GeoPoint(coordinates.$1, coordinates.$2),
    };
  }
}

@JsonEnum(valueField: 'key')
enum Weekday {
  monday("monday"),
  tuesday("tuesday"),
  wednesday("wednesday"),
  thursday("thursday"),
  friday("friday"),
  saturday("saturday"),
  sunday("sunday");

  const Weekday(this.key);

  final String key;

  String present() => switch (this) {
        Weekday.monday => "Понедельник",
        Weekday.tuesday => "Вторник",
        Weekday.wednesday => "Среда",
        Weekday.thursday => "Четверг",
        Weekday.friday => "Пятница",
        Weekday.saturday => "Суббота",
        Weekday.sunday => "Воскресенье",
      };
}

@freezed
class Time with _$Time {
  const factory Time({
    required Weekday day,
    required String from,
    required String to,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    required String name,
    required String description,
    required int price,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class Review with _$Review {
  const Review._();

  const factory Review({
    required String id,
    required String userId,
    String? userProfileImage,
    required String userFullName,
    required int userReviewsCount,
    required int rating,
    required String comment,
    required int likes,
    required int repliesCount,
    required DateTime createdAt,
  }) = _Review;

  factory Review.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;

    return Review(
      id: doc.id,
      userId: data['userId'] as String,
      userProfileImage: data['userProfileImage'] as String?,
      userFullName: data['userFullName'] as String,
      userReviewsCount: data["userReviewsCount"] as int,
      rating: data["rating"] as int,
      comment: data["comment"] as String,
      likes: data["likes"] as int,
      repliesCount: data["repliesCount"] as int,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}

@freezed
class Reply with _$Reply {
  const Reply._();

  const factory Reply({
    required String id,
    required String userId,
    String? userProfileImage,
    required String userFullName,
    required String comment,
    required DateTime createdAt,
  }) = _Reply;

  factory Reply.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;

    return Reply(
      id: doc.id,
      userId: data['userId'] as String,
      userProfileImage: data['userProfileImage'] as String?,
      userFullName: data['userFullName'] as String,
      comment: data["comment"] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}
