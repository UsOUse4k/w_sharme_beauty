// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommunityComment _$CommunityCommentFromJson(Map<String, dynamic> json) {
  return _CommunityComment.fromJson(json);
}

/// @nodoc
mixin _$CommunityComment {
  String get uid => throw _privateConstructorUsedError;
  String? get commentId => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  int get replies => throw _privateConstructorUsedError;
  String? get parentCommentId => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunityCommentCopyWith<CommunityComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityCommentCopyWith<$Res> {
  factory $CommunityCommentCopyWith(
          CommunityComment value, $Res Function(CommunityComment) then) =
      _$CommunityCommentCopyWithImpl<$Res, CommunityComment>;
  @useResult
  $Res call(
      {String uid,
      String? commentId,
      String? comment,
      String? username,
      String? avatarUrl,
      List<String> likes,
      int replies,
      String? parentCommentId,
      @TimestampConverter() Timestamp? createdAt});
}

/// @nodoc
class _$CommunityCommentCopyWithImpl<$Res, $Val extends CommunityComment>
    implements $CommunityCommentCopyWith<$Res> {
  _$CommunityCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? commentId = freezed,
    Object? comment = freezed,
    Object? username = freezed,
    Object? avatarUrl = freezed,
    Object? likes = null,
    Object? replies = null,
    Object? parentCommentId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as int,
      parentCommentId: freezed == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityCommentImplCopyWith<$Res>
    implements $CommunityCommentCopyWith<$Res> {
  factory _$$CommunityCommentImplCopyWith(_$CommunityCommentImpl value,
          $Res Function(_$CommunityCommentImpl) then) =
      __$$CommunityCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? commentId,
      String? comment,
      String? username,
      String? avatarUrl,
      List<String> likes,
      int replies,
      String? parentCommentId,
      @TimestampConverter() Timestamp? createdAt});
}

/// @nodoc
class __$$CommunityCommentImplCopyWithImpl<$Res>
    extends _$CommunityCommentCopyWithImpl<$Res, _$CommunityCommentImpl>
    implements _$$CommunityCommentImplCopyWith<$Res> {
  __$$CommunityCommentImplCopyWithImpl(_$CommunityCommentImpl _value,
      $Res Function(_$CommunityCommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? commentId = freezed,
    Object? comment = freezed,
    Object? username = freezed,
    Object? avatarUrl = freezed,
    Object? likes = null,
    Object? replies = null,
    Object? parentCommentId = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$CommunityCommentImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as int,
      parentCommentId: freezed == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunityCommentImpl implements _CommunityComment {
  const _$CommunityCommentImpl(
      {this.uid = '',
      this.commentId = '',
      this.comment = '',
      this.username = '',
      this.avatarUrl = '',
      final List<String> likes = const [],
      this.replies = 0,
      this.parentCommentId = '',
      @TimestampConverter() this.createdAt})
      : _likes = likes;

  factory _$CommunityCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunityCommentImplFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String? commentId;
  @override
  @JsonKey()
  final String? comment;
  @override
  @JsonKey()
  final String? username;
  @override
  @JsonKey()
  final String? avatarUrl;
  final List<String> _likes;
  @override
  @JsonKey()
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  @override
  @JsonKey()
  final int replies;
  @override
  @JsonKey()
  final String? parentCommentId;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;

  @override
  String toString() {
    return 'CommunityComment(uid: $uid, commentId: $commentId, comment: $comment, username: $username, avatarUrl: $avatarUrl, likes: $likes, replies: $replies, parentCommentId: $parentCommentId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityCommentImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.replies, replies) || other.replies == replies) &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      commentId,
      comment,
      username,
      avatarUrl,
      const DeepCollectionEquality().hash(_likes),
      replies,
      parentCommentId,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityCommentImplCopyWith<_$CommunityCommentImpl> get copyWith =>
      __$$CommunityCommentImplCopyWithImpl<_$CommunityCommentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunityCommentImplToJson(
      this,
    );
  }
}

abstract class _CommunityComment implements CommunityComment {
  const factory _CommunityComment(
          {final String uid,
          final String? commentId,
          final String? comment,
          final String? username,
          final String? avatarUrl,
          final List<String> likes,
          final int replies,
          final String? parentCommentId,
          @TimestampConverter() final Timestamp? createdAt}) =
      _$CommunityCommentImpl;

  factory _CommunityComment.fromJson(Map<String, dynamic> json) =
      _$CommunityCommentImpl.fromJson;

  @override
  String get uid;
  @override
  String? get commentId;
  @override
  String? get comment;
  @override
  String? get username;
  @override
  String? get avatarUrl;
  @override
  List<String> get likes;
  @override
  int get replies;
  @override
  String? get parentCommentId;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CommunityCommentImplCopyWith<_$CommunityCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
