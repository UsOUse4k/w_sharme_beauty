// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_parent_commet_id_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityParentCommetIdEvent {
  String get parentCommentId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String parentCommentId, String username)
        addCommunityParentCommetId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String parentCommentId, String username)?
        addCommunityParentCommetId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String parentCommentId, String username)?
        addCommunityParentCommetId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCommunityParentCommetId value)
        addCommunityParentCommetId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCommunityParentCommetId value)?
        addCommunityParentCommetId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCommunityParentCommetId value)?
        addCommunityParentCommetId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommunityParentCommetIdEventCopyWith<CommunityParentCommetIdEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityParentCommetIdEventCopyWith<$Res> {
  factory $CommunityParentCommetIdEventCopyWith(
          CommunityParentCommetIdEvent value,
          $Res Function(CommunityParentCommetIdEvent) then) =
      _$CommunityParentCommetIdEventCopyWithImpl<$Res,
          CommunityParentCommetIdEvent>;
  @useResult
  $Res call({String parentCommentId, String username});
}

/// @nodoc
class _$CommunityParentCommetIdEventCopyWithImpl<$Res,
        $Val extends CommunityParentCommetIdEvent>
    implements $CommunityParentCommetIdEventCopyWith<$Res> {
  _$CommunityParentCommetIdEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentCommentId = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      parentCommentId: null == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCommunityParentCommetIdImplCopyWith<$Res>
    implements $CommunityParentCommetIdEventCopyWith<$Res> {
  factory _$$AddCommunityParentCommetIdImplCopyWith(
          _$AddCommunityParentCommetIdImpl value,
          $Res Function(_$AddCommunityParentCommetIdImpl) then) =
      __$$AddCommunityParentCommetIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String parentCommentId, String username});
}

/// @nodoc
class __$$AddCommunityParentCommetIdImplCopyWithImpl<$Res>
    extends _$CommunityParentCommetIdEventCopyWithImpl<$Res,
        _$AddCommunityParentCommetIdImpl>
    implements _$$AddCommunityParentCommetIdImplCopyWith<$Res> {
  __$$AddCommunityParentCommetIdImplCopyWithImpl(
      _$AddCommunityParentCommetIdImpl _value,
      $Res Function(_$AddCommunityParentCommetIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentCommentId = null,
    Object? username = null,
  }) {
    return _then(_$AddCommunityParentCommetIdImpl(
      null == parentCommentId
          ? _value.parentCommentId
          : parentCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddCommunityParentCommetIdImpl implements _AddCommunityParentCommetId {
  const _$AddCommunityParentCommetIdImpl(this.parentCommentId, this.username);

  @override
  final String parentCommentId;
  @override
  final String username;

  @override
  String toString() {
    return 'CommunityParentCommetIdEvent.addCommunityParentCommetId(parentCommentId: $parentCommentId, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCommunityParentCommetIdImpl &&
            (identical(other.parentCommentId, parentCommentId) ||
                other.parentCommentId == parentCommentId) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, parentCommentId, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCommunityParentCommetIdImplCopyWith<_$AddCommunityParentCommetIdImpl>
      get copyWith => __$$AddCommunityParentCommetIdImplCopyWithImpl<
          _$AddCommunityParentCommetIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String parentCommentId, String username)
        addCommunityParentCommetId,
  }) {
    return addCommunityParentCommetId(parentCommentId, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String parentCommentId, String username)?
        addCommunityParentCommetId,
  }) {
    return addCommunityParentCommetId?.call(parentCommentId, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String parentCommentId, String username)?
        addCommunityParentCommetId,
    required TResult orElse(),
  }) {
    if (addCommunityParentCommetId != null) {
      return addCommunityParentCommetId(parentCommentId, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCommunityParentCommetId value)
        addCommunityParentCommetId,
  }) {
    return addCommunityParentCommetId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCommunityParentCommetId value)?
        addCommunityParentCommetId,
  }) {
    return addCommunityParentCommetId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCommunityParentCommetId value)?
        addCommunityParentCommetId,
    required TResult orElse(),
  }) {
    if (addCommunityParentCommetId != null) {
      return addCommunityParentCommetId(this);
    }
    return orElse();
  }
}

abstract class _AddCommunityParentCommetId
    implements CommunityParentCommetIdEvent {
  const factory _AddCommunityParentCommetId(
          final String parentCommentId, final String username) =
      _$AddCommunityParentCommetIdImpl;

  @override
  String get parentCommentId;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$AddCommunityParentCommetIdImplCopyWith<_$AddCommunityParentCommetIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}
