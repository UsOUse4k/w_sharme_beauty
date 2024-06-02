// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Advert _$AdvertFromJson(Map<String, dynamic> json) {
  return _Advert.fromJson(json);
}

/// @nodoc
mixin _$Advert {
  String? get authorId => throw _privateConstructorUsedError;
  String? get advertId => throw _privateConstructorUsedError;
  String? get sloonName => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get schedule => throw _privateConstructorUsedError;
  String? get productServices => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  List<String> get reposts => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvertCopyWith<Advert> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertCopyWith<$Res> {
  factory $AdvertCopyWith(Advert value, $Res Function(Advert) then) =
      _$AdvertCopyWithImpl<$Res, Advert>;
  @useResult
  $Res call(
      {String? authorId,
      String? advertId,
      String? sloonName,
      String? category,
      String? address,
      String? phoneNumber,
      String? description,
      String? schedule,
      String? productServices,
      List<String> imageUrls,
      String? avatarUrl,
      String? videoUrl,
      int commentsCount,
      List<String> likes,
      List<String> reposts,
      bool isFavorite,
      String? createdAt});
}

/// @nodoc
class _$AdvertCopyWithImpl<$Res, $Val extends Advert>
    implements $AdvertCopyWith<$Res> {
  _$AdvertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorId = freezed,
    Object? advertId = freezed,
    Object? sloonName = freezed,
    Object? category = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? description = freezed,
    Object? schedule = freezed,
    Object? productServices = freezed,
    Object? imageUrls = null,
    Object? avatarUrl = freezed,
    Object? videoUrl = freezed,
    Object? commentsCount = null,
    Object? likes = null,
    Object? reposts = null,
    Object? isFavorite = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      advertId: freezed == advertId
          ? _value.advertId
          : advertId // ignore: cast_nullable_to_non_nullable
              as String?,
      sloonName: freezed == sloonName
          ? _value.sloonName
          : sloonName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String?,
      productServices: freezed == productServices
          ? _value.productServices
          : productServices // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reposts: null == reposts
          ? _value.reposts
          : reposts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvertImplCopyWith<$Res> implements $AdvertCopyWith<$Res> {
  factory _$$AdvertImplCopyWith(
          _$AdvertImpl value, $Res Function(_$AdvertImpl) then) =
      __$$AdvertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? authorId,
      String? advertId,
      String? sloonName,
      String? category,
      String? address,
      String? phoneNumber,
      String? description,
      String? schedule,
      String? productServices,
      List<String> imageUrls,
      String? avatarUrl,
      String? videoUrl,
      int commentsCount,
      List<String> likes,
      List<String> reposts,
      bool isFavorite,
      String? createdAt});
}

/// @nodoc
class __$$AdvertImplCopyWithImpl<$Res>
    extends _$AdvertCopyWithImpl<$Res, _$AdvertImpl>
    implements _$$AdvertImplCopyWith<$Res> {
  __$$AdvertImplCopyWithImpl(
      _$AdvertImpl _value, $Res Function(_$AdvertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorId = freezed,
    Object? advertId = freezed,
    Object? sloonName = freezed,
    Object? category = freezed,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? description = freezed,
    Object? schedule = freezed,
    Object? productServices = freezed,
    Object? imageUrls = null,
    Object? avatarUrl = freezed,
    Object? videoUrl = freezed,
    Object? commentsCount = null,
    Object? likes = null,
    Object? reposts = null,
    Object? isFavorite = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$AdvertImpl(
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      advertId: freezed == advertId
          ? _value.advertId
          : advertId // ignore: cast_nullable_to_non_nullable
              as String?,
      sloonName: freezed == sloonName
          ? _value.sloonName
          : sloonName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as String?,
      productServices: freezed == productServices
          ? _value.productServices
          : productServices // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reposts: null == reposts
          ? _value._reposts
          : reposts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdvertImpl implements _Advert {
  const _$AdvertImpl(
      {this.authorId,
      this.advertId,
      this.sloonName,
      this.category,
      this.address,
      this.phoneNumber,
      this.description,
      this.schedule,
      this.productServices,
      final List<String> imageUrls = const [],
      this.avatarUrl = '',
      this.videoUrl,
      this.commentsCount = 0,
      final List<String> likes = const [],
      final List<String> reposts = const [],
      this.isFavorite = false,
      this.createdAt = ''})
      : _imageUrls = imageUrls,
        _likes = likes,
        _reposts = reposts;

  factory _$AdvertImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdvertImplFromJson(json);

  @override
  final String? authorId;
  @override
  final String? advertId;
  @override
  final String? sloonName;
  @override
  final String? category;
  @override
  final String? address;
  @override
  final String? phoneNumber;
  @override
  final String? description;
  @override
  final String? schedule;
  @override
  final String? productServices;
  final List<String> _imageUrls;
  @override
  @JsonKey()
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  @JsonKey()
  final String? avatarUrl;
  @override
  final String? videoUrl;
  @override
  @JsonKey()
  final int commentsCount;
  final List<String> _likes;
  @override
  @JsonKey()
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  final List<String> _reposts;
  @override
  @JsonKey()
  List<String> get reposts {
    if (_reposts is EqualUnmodifiableListView) return _reposts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reposts);
  }

  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final String? createdAt;

  @override
  String toString() {
    return 'Advert(authorId: $authorId, advertId: $advertId, sloonName: $sloonName, category: $category, address: $address, phoneNumber: $phoneNumber, description: $description, schedule: $schedule, productServices: $productServices, imageUrls: $imageUrls, avatarUrl: $avatarUrl, videoUrl: $videoUrl, commentsCount: $commentsCount, likes: $likes, reposts: $reposts, isFavorite: $isFavorite, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertImpl &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.advertId, advertId) ||
                other.advertId == advertId) &&
            (identical(other.sloonName, sloonName) ||
                other.sloonName == sloonName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.productServices, productServices) ||
                other.productServices == productServices) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other._reposts, _reposts) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      authorId,
      advertId,
      sloonName,
      category,
      address,
      phoneNumber,
      description,
      schedule,
      productServices,
      const DeepCollectionEquality().hash(_imageUrls),
      avatarUrl,
      videoUrl,
      commentsCount,
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(_reposts),
      isFavorite,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvertImplCopyWith<_$AdvertImpl> get copyWith =>
      __$$AdvertImplCopyWithImpl<_$AdvertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdvertImplToJson(
      this,
    );
  }
}

abstract class _Advert implements Advert {
  const factory _Advert(
      {final String? authorId,
      final String? advertId,
      final String? sloonName,
      final String? category,
      final String? address,
      final String? phoneNumber,
      final String? description,
      final String? schedule,
      final String? productServices,
      final List<String> imageUrls,
      final String? avatarUrl,
      final String? videoUrl,
      final int commentsCount,
      final List<String> likes,
      final List<String> reposts,
      final bool isFavorite,
      final String? createdAt}) = _$AdvertImpl;

  factory _Advert.fromJson(Map<String, dynamic> json) = _$AdvertImpl.fromJson;

  @override
  String? get authorId;
  @override
  String? get advertId;
  @override
  String? get sloonName;
  @override
  String? get category;
  @override
  String? get address;
  @override
  String? get phoneNumber;
  @override
  String? get description;
  @override
  String? get schedule;
  @override
  String? get productServices;
  @override
  List<String> get imageUrls;
  @override
  String? get avatarUrl;
  @override
  String? get videoUrl;
  @override
  int get commentsCount;
  @override
  List<String> get likes;
  @override
  List<String> get reposts;
  @override
  bool get isFavorite;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$AdvertImplCopyWith<_$AdvertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
