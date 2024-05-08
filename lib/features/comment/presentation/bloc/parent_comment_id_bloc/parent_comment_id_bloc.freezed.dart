// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parent_comment_id_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParentCommentIdEvent {
  String get parentCommentId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String parentCommentId, String username)
        addParentCommentId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String parentCommentId, String username)?
        addParentCommentId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String parentCommentId, String username)?
        addParentCommentId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) addParentCommentId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? addParentCommentId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? addParentCommentId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParentCommentIdEventCopyWith<ParentCommentIdEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentCommentIdEventCopyWith<$Res> {
  factory $ParentCommentIdEventCopyWith(ParentCommentIdEvent value,
          $Res Function(ParentCommentIdEvent) then) =
      _$ParentCommentIdEventCopyWithImpl<$Res, ParentCommentIdEvent>;
  @useResult
  $Res call({String parentCommentId, String username});
}

/// @nodoc
class _$ParentCommentIdEventCopyWithImpl<$Res,
        $Val extends ParentCommentIdEvent>
    implements $ParentCommentIdEventCopyWith<$Res> {
  _$ParentCommentIdEventCopyWithImpl(this._value, this._then);

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
abstract class _$$StartedImplCopyWith<$Res>
    implements $ParentCommentIdEventCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String parentCommentId, String username});
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ParentCommentIdEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parentCommentId = null,
    Object? username = null,
  }) {
    return _then(_$StartedImpl(
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

class _$StartedImpl implements _Started {
  const _$StartedImpl(this.parentCommentId, this.username);

  @override
  final String parentCommentId;
  @override
  final String username;

  @override
  String toString() {
    return 'ParentCommentIdEvent.addParentCommentId(parentCommentId: $parentCommentId, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartedImpl &&
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
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      __$$StartedImplCopyWithImpl<_$StartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String parentCommentId, String username)
        addParentCommentId,
  }) {
    return addParentCommentId(parentCommentId, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String parentCommentId, String username)?
        addParentCommentId,
  }) {
    return addParentCommentId?.call(parentCommentId, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String parentCommentId, String username)?
        addParentCommentId,
    required TResult orElse(),
  }) {
    if (addParentCommentId != null) {
      return addParentCommentId(parentCommentId, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) addParentCommentId,
  }) {
    return addParentCommentId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? addParentCommentId,
  }) {
    return addParentCommentId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? addParentCommentId,
    required TResult orElse(),
  }) {
    if (addParentCommentId != null) {
      return addParentCommentId(this);
    }
    return orElse();
  }
}

abstract class _Started implements ParentCommentIdEvent {
  const factory _Started(final String parentCommentId, final String username) =
      _$StartedImpl;

  @override
  String get parentCommentId;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$StartedImplCopyWith<_$StartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
