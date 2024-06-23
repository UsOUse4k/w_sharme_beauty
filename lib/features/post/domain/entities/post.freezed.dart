// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String? get authorId => throw _privateConstructorUsedError;
  String? get postId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  int get commentsCount => throw _privateConstructorUsedError;
  int get repostCount => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  List<String> get reposts => throw _privateConstructorUsedError;
  List<String>? get followers => throw _privateConstructorUsedError;
  List<String>? get subscriptions => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String? authorId,
      String? postId,
      String? username,
      String? category,
      String text,
      List<String> imageUrls,
      String? avatarUrl,
      String? videoUrl,
      int commentsCount,
      int repostCount,
      List<String> likes,
      List<String> reposts,
      List<String>? followers,
      List<String>? subscriptions,
      bool isFavorite,
      String? createdAt});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorId = freezed,
    Object? postId = freezed,
    Object? username = freezed,
    Object? category = freezed,
    Object? text = null,
    Object? imageUrls = null,
    Object? avatarUrl = freezed,
    Object? videoUrl = freezed,
    Object? commentsCount = null,
    Object? repostCount = null,
    Object? likes = null,
    Object? reposts = null,
    Object? followers = freezed,
    Object? subscriptions = freezed,
    Object? isFavorite = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
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
      repostCount: null == repostCount
          ? _value.repostCount
          : repostCount // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reposts: null == reposts
          ? _value.reposts
          : reposts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: freezed == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subscriptions: freezed == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? authorId,
      String? postId,
      String? username,
      String? category,
      String text,
      List<String> imageUrls,
      String? avatarUrl,
      String? videoUrl,
      int commentsCount,
      int repostCount,
      List<String> likes,
      List<String> reposts,
      List<String>? followers,
      List<String>? subscriptions,
      bool isFavorite,
      String? createdAt});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorId = freezed,
    Object? postId = freezed,
    Object? username = freezed,
    Object? category = freezed,
    Object? text = null,
    Object? imageUrls = null,
    Object? avatarUrl = freezed,
    Object? videoUrl = freezed,
    Object? commentsCount = null,
    Object? repostCount = null,
    Object? likes = null,
    Object? reposts = null,
    Object? followers = freezed,
    Object? subscriptions = freezed,
    Object? isFavorite = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$PostImpl(
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
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
      repostCount: null == repostCount
          ? _value.repostCount
          : repostCount // ignore: cast_nullable_to_non_nullable
              as int,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      reposts: null == reposts
          ? _value._reposts
          : reposts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: freezed == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subscriptions: freezed == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
class _$PostImpl implements _Post {
  const _$PostImpl(
      {this.authorId,
      this.postId,
      this.username,
      this.category,
      required this.text,
      final List<String> imageUrls = const [],
      this.avatarUrl = '',
      this.videoUrl,
      this.commentsCount = 0,
      this.repostCount = 0,
      final List<String> likes = const [],
      final List<String> reposts = const [],
      final List<String>? followers = const [],
      final List<String>? subscriptions = const [],
      this.isFavorite = false,
      this.createdAt = ''})
      : _imageUrls = imageUrls,
        _likes = likes,
        _reposts = reposts,
        _followers = followers,
        _subscriptions = subscriptions;

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String? authorId;
  @override
  final String? postId;
  @override
  final String? username;
  @override
  final String? category;
  @override
  final String text;
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
  @override
  @JsonKey()
  final int repostCount;
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

  final List<String>? _followers;
  @override
  @JsonKey()
  List<String>? get followers {
    final value = _followers;
    if (value == null) return null;
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _subscriptions;
  @override
  @JsonKey()
  List<String>? get subscriptions {
    final value = _subscriptions;
    if (value == null) return null;
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final String? createdAt;

  @override
  String toString() {
    return 'Post(authorId: $authorId, postId: $postId, username: $username, category: $category, text: $text, imageUrls: $imageUrls, avatarUrl: $avatarUrl, videoUrl: $videoUrl, commentsCount: $commentsCount, repostCount: $repostCount, likes: $likes, reposts: $reposts, followers: $followers, subscriptions: $subscriptions, isFavorite: $isFavorite, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.repostCount, repostCount) ||
                other.repostCount == repostCount) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other._reposts, _reposts) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions) &&
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
      postId,
      username,
      category,
      text,
      const DeepCollectionEquality().hash(_imageUrls),
      avatarUrl,
      videoUrl,
      commentsCount,
      repostCount,
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(_reposts),
      const DeepCollectionEquality().hash(_followers),
      const DeepCollectionEquality().hash(_subscriptions),
      isFavorite,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {final String? authorId,
      final String? postId,
      final String? username,
      final String? category,
      required final String text,
      final List<String> imageUrls,
      final String? avatarUrl,
      final String? videoUrl,
      final int commentsCount,
      final int repostCount,
      final List<String> likes,
      final List<String> reposts,
      final List<String>? followers,
      final List<String>? subscriptions,
      final bool isFavorite,
      final String? createdAt}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String? get authorId;
  @override
  String? get postId;
  @override
  String? get username;
  @override
  String? get category;
  @override
  String get text;
  @override
  List<String> get imageUrls;
  @override
  String? get avatarUrl;
  @override
  String? get videoUrl;
  @override
  int get commentsCount;
  @override
  int get repostCount;
  @override
  List<String> get likes;
  @override
  List<String> get reposts;
  @override
  List<String>? get followers;
  @override
  List<String>? get subscriptions;
  @override
  bool get isFavorite;
  @override
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
