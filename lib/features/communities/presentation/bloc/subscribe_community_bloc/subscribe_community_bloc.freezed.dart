// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_community_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscribeCommunityEvent {
  String? get targetUid => throw _privateConstructorUsedError;
  String? get chatGroupId => throw _privateConstructorUsedError;
  String? get communityId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)
        subscribeCommunity,
    required TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)
        unsubscribeCommunity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        subscribeCommunity,
    TResult? Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        unsubscribeCommunity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        subscribeCommunity,
    TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        unsubscribeCommunity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubscribeCommunity value) subscribeCommunity,
    required TResult Function(_UnSubscribeCommunity value) unsubscribeCommunity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubscribeCommunity value)? subscribeCommunity,
    TResult? Function(_UnSubscribeCommunity value)? unsubscribeCommunity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubscribeCommunity value)? subscribeCommunity,
    TResult Function(_UnSubscribeCommunity value)? unsubscribeCommunity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscribeCommunityEventCopyWith<SubscribeCommunityEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeCommunityEventCopyWith<$Res> {
  factory $SubscribeCommunityEventCopyWith(SubscribeCommunityEvent value,
          $Res Function(SubscribeCommunityEvent) then) =
      _$SubscribeCommunityEventCopyWithImpl<$Res, SubscribeCommunityEvent>;
  @useResult
  $Res call({String? targetUid, String? chatGroupId, String? communityId});
}

/// @nodoc
class _$SubscribeCommunityEventCopyWithImpl<$Res,
        $Val extends SubscribeCommunityEvent>
    implements $SubscribeCommunityEventCopyWith<$Res> {
  _$SubscribeCommunityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetUid = freezed,
    Object? chatGroupId = freezed,
    Object? communityId = freezed,
  }) {
    return _then(_value.copyWith(
      targetUid: freezed == targetUid
          ? _value.targetUid
          : targetUid // ignore: cast_nullable_to_non_nullable
              as String?,
      chatGroupId: freezed == chatGroupId
          ? _value.chatGroupId
          : chatGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      communityId: freezed == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscribeCommunityImplCopyWith<$Res>
    implements $SubscribeCommunityEventCopyWith<$Res> {
  factory _$$SubscribeCommunityImplCopyWith(_$SubscribeCommunityImpl value,
          $Res Function(_$SubscribeCommunityImpl) then) =
      __$$SubscribeCommunityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? targetUid, String? chatGroupId, String? communityId});
}

/// @nodoc
class __$$SubscribeCommunityImplCopyWithImpl<$Res>
    extends _$SubscribeCommunityEventCopyWithImpl<$Res,
        _$SubscribeCommunityImpl>
    implements _$$SubscribeCommunityImplCopyWith<$Res> {
  __$$SubscribeCommunityImplCopyWithImpl(_$SubscribeCommunityImpl _value,
      $Res Function(_$SubscribeCommunityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetUid = freezed,
    Object? chatGroupId = freezed,
    Object? communityId = freezed,
  }) {
    return _then(_$SubscribeCommunityImpl(
      targetUid: freezed == targetUid
          ? _value.targetUid
          : targetUid // ignore: cast_nullable_to_non_nullable
              as String?,
      chatGroupId: freezed == chatGroupId
          ? _value.chatGroupId
          : chatGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      communityId: freezed == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SubscribeCommunityImpl implements _SubscribeCommunity {
  const _$SubscribeCommunityImpl(
      {this.targetUid, this.chatGroupId, this.communityId});

  @override
  final String? targetUid;
  @override
  final String? chatGroupId;
  @override
  final String? communityId;

  @override
  String toString() {
    return 'SubscribeCommunityEvent.subscribeCommunity(targetUid: $targetUid, chatGroupId: $chatGroupId, communityId: $communityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeCommunityImpl &&
            (identical(other.targetUid, targetUid) ||
                other.targetUid == targetUid) &&
            (identical(other.chatGroupId, chatGroupId) ||
                other.chatGroupId == chatGroupId) &&
            (identical(other.communityId, communityId) ||
                other.communityId == communityId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, targetUid, chatGroupId, communityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeCommunityImplCopyWith<_$SubscribeCommunityImpl> get copyWith =>
      __$$SubscribeCommunityImplCopyWithImpl<_$SubscribeCommunityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)
        subscribeCommunity,
    required TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)
        unsubscribeCommunity,
  }) {
    return subscribeCommunity(targetUid, chatGroupId, communityId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        subscribeCommunity,
    TResult? Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        unsubscribeCommunity,
  }) {
    return subscribeCommunity?.call(targetUid, chatGroupId, communityId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        subscribeCommunity,
    TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        unsubscribeCommunity,
    required TResult orElse(),
  }) {
    if (subscribeCommunity != null) {
      return subscribeCommunity(targetUid, chatGroupId, communityId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubscribeCommunity value) subscribeCommunity,
    required TResult Function(_UnSubscribeCommunity value) unsubscribeCommunity,
  }) {
    return subscribeCommunity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubscribeCommunity value)? subscribeCommunity,
    TResult? Function(_UnSubscribeCommunity value)? unsubscribeCommunity,
  }) {
    return subscribeCommunity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubscribeCommunity value)? subscribeCommunity,
    TResult Function(_UnSubscribeCommunity value)? unsubscribeCommunity,
    required TResult orElse(),
  }) {
    if (subscribeCommunity != null) {
      return subscribeCommunity(this);
    }
    return orElse();
  }
}

abstract class _SubscribeCommunity implements SubscribeCommunityEvent {
  const factory _SubscribeCommunity(
      {final String? targetUid,
      final String? chatGroupId,
      final String? communityId}) = _$SubscribeCommunityImpl;

  @override
  String? get targetUid;
  @override
  String? get chatGroupId;
  @override
  String? get communityId;
  @override
  @JsonKey(ignore: true)
  _$$SubscribeCommunityImplCopyWith<_$SubscribeCommunityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnSubscribeCommunityImplCopyWith<$Res>
    implements $SubscribeCommunityEventCopyWith<$Res> {
  factory _$$UnSubscribeCommunityImplCopyWith(_$UnSubscribeCommunityImpl value,
          $Res Function(_$UnSubscribeCommunityImpl) then) =
      __$$UnSubscribeCommunityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? targetUid, String? chatGroupId, String? communityId});
}

/// @nodoc
class __$$UnSubscribeCommunityImplCopyWithImpl<$Res>
    extends _$SubscribeCommunityEventCopyWithImpl<$Res,
        _$UnSubscribeCommunityImpl>
    implements _$$UnSubscribeCommunityImplCopyWith<$Res> {
  __$$UnSubscribeCommunityImplCopyWithImpl(_$UnSubscribeCommunityImpl _value,
      $Res Function(_$UnSubscribeCommunityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetUid = freezed,
    Object? chatGroupId = freezed,
    Object? communityId = freezed,
  }) {
    return _then(_$UnSubscribeCommunityImpl(
      targetUid: freezed == targetUid
          ? _value.targetUid
          : targetUid // ignore: cast_nullable_to_non_nullable
              as String?,
      chatGroupId: freezed == chatGroupId
          ? _value.chatGroupId
          : chatGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
      communityId: freezed == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnSubscribeCommunityImpl implements _UnSubscribeCommunity {
  const _$UnSubscribeCommunityImpl(
      {this.targetUid, this.chatGroupId, this.communityId});

  @override
  final String? targetUid;
  @override
  final String? chatGroupId;
  @override
  final String? communityId;

  @override
  String toString() {
    return 'SubscribeCommunityEvent.unsubscribeCommunity(targetUid: $targetUid, chatGroupId: $chatGroupId, communityId: $communityId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnSubscribeCommunityImpl &&
            (identical(other.targetUid, targetUid) ||
                other.targetUid == targetUid) &&
            (identical(other.chatGroupId, chatGroupId) ||
                other.chatGroupId == chatGroupId) &&
            (identical(other.communityId, communityId) ||
                other.communityId == communityId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, targetUid, chatGroupId, communityId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnSubscribeCommunityImplCopyWith<_$UnSubscribeCommunityImpl>
      get copyWith =>
          __$$UnSubscribeCommunityImplCopyWithImpl<_$UnSubscribeCommunityImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)
        subscribeCommunity,
    required TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)
        unsubscribeCommunity,
  }) {
    return unsubscribeCommunity(targetUid, chatGroupId, communityId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        subscribeCommunity,
    TResult? Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        unsubscribeCommunity,
  }) {
    return unsubscribeCommunity?.call(targetUid, chatGroupId, communityId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        subscribeCommunity,
    TResult Function(
            String? targetUid, String? chatGroupId, String? communityId)?
        unsubscribeCommunity,
    required TResult orElse(),
  }) {
    if (unsubscribeCommunity != null) {
      return unsubscribeCommunity(targetUid, chatGroupId, communityId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubscribeCommunity value) subscribeCommunity,
    required TResult Function(_UnSubscribeCommunity value) unsubscribeCommunity,
  }) {
    return unsubscribeCommunity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubscribeCommunity value)? subscribeCommunity,
    TResult? Function(_UnSubscribeCommunity value)? unsubscribeCommunity,
  }) {
    return unsubscribeCommunity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubscribeCommunity value)? subscribeCommunity,
    TResult Function(_UnSubscribeCommunity value)? unsubscribeCommunity,
    required TResult orElse(),
  }) {
    if (unsubscribeCommunity != null) {
      return unsubscribeCommunity(this);
    }
    return orElse();
  }
}

abstract class _UnSubscribeCommunity implements SubscribeCommunityEvent {
  const factory _UnSubscribeCommunity(
      {final String? targetUid,
      final String? chatGroupId,
      final String? communityId}) = _$UnSubscribeCommunityImpl;

  @override
  String? get targetUid;
  @override
  String? get chatGroupId;
  @override
  String? get communityId;
  @override
  @JsonKey(ignore: true)
  _$$UnSubscribeCommunityImplCopyWith<_$UnSubscribeCommunityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubscribeCommunityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeCommunityStateCopyWith<$Res> {
  factory $SubscribeCommunityStateCopyWith(SubscribeCommunityState value,
          $Res Function(SubscribeCommunityState) then) =
      _$SubscribeCommunityStateCopyWithImpl<$Res, SubscribeCommunityState>;
}

/// @nodoc
class _$SubscribeCommunityStateCopyWithImpl<$Res,
        $Val extends SubscribeCommunityState>
    implements $SubscribeCommunityStateCopyWith<$Res> {
  _$SubscribeCommunityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SubscribeCommunityStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SubscribeCommunityState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SubscribeCommunityState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SubscribeCommunityStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'SubscribeCommunityState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements SubscribeCommunityState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$SubscribeCommunityStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SubscribeCommunityState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SubscribeCommunityState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SubscribeCommunityStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SubscribeCommunityState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SubscribeCommunityState {
  const factory _Loading() = _$LoadingImpl;
}
