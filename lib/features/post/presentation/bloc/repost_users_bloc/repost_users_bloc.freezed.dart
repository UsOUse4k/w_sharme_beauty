// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repost_users_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepostUsersEvent {
  String get uid => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) addUserdIds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? addUserdIds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? addUserdIds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddUserIds value) addUserdIds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddUserIds value)? addUserdIds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddUserIds value)? addUserdIds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepostUsersEventCopyWith<RepostUsersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepostUsersEventCopyWith<$Res> {
  factory $RepostUsersEventCopyWith(
          RepostUsersEvent value, $Res Function(RepostUsersEvent) then) =
      _$RepostUsersEventCopyWithImpl<$Res, RepostUsersEvent>;
  @useResult
  $Res call({String uid});
}

/// @nodoc
class _$RepostUsersEventCopyWithImpl<$Res, $Val extends RepostUsersEvent>
    implements $RepostUsersEventCopyWith<$Res> {
  _$RepostUsersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddUserIdsImplCopyWith<$Res>
    implements $RepostUsersEventCopyWith<$Res> {
  factory _$$AddUserIdsImplCopyWith(
          _$AddUserIdsImpl value, $Res Function(_$AddUserIdsImpl) then) =
      __$$AddUserIdsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid});
}

/// @nodoc
class __$$AddUserIdsImplCopyWithImpl<$Res>
    extends _$RepostUsersEventCopyWithImpl<$Res, _$AddUserIdsImpl>
    implements _$$AddUserIdsImplCopyWith<$Res> {
  __$$AddUserIdsImplCopyWithImpl(
      _$AddUserIdsImpl _value, $Res Function(_$AddUserIdsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
  }) {
    return _then(_$AddUserIdsImpl(
      null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddUserIdsImpl implements _AddUserIds {
  const _$AddUserIdsImpl(this.uid);

  @override
  final String uid;

  @override
  String toString() {
    return 'RepostUsersEvent.addUserdIds(uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddUserIdsImpl &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddUserIdsImplCopyWith<_$AddUserIdsImpl> get copyWith =>
      __$$AddUserIdsImplCopyWithImpl<_$AddUserIdsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) addUserdIds,
  }) {
    return addUserdIds(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uid)? addUserdIds,
  }) {
    return addUserdIds?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? addUserdIds,
    required TResult orElse(),
  }) {
    if (addUserdIds != null) {
      return addUserdIds(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddUserIds value) addUserdIds,
  }) {
    return addUserdIds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddUserIds value)? addUserdIds,
  }) {
    return addUserdIds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddUserIds value)? addUserdIds,
    required TResult orElse(),
  }) {
    if (addUserdIds != null) {
      return addUserdIds(this);
    }
    return orElse();
  }
}

abstract class _AddUserIds implements RepostUsersEvent {
  const factory _AddUserIds(final String uid) = _$AddUserIdsImpl;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$AddUserIdsImplCopyWith<_$AddUserIdsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RepostUsersState {
  List<String> get selectecUserIds => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> selectecUserIds) selectedUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> selectecUserIds)? selectedUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> selectecUserIds)? selectedUserId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedUserId value) selectedUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedUserId value)? selectedUserId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedUserId value)? selectedUserId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepostUsersStateCopyWith<RepostUsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepostUsersStateCopyWith<$Res> {
  factory $RepostUsersStateCopyWith(
          RepostUsersState value, $Res Function(RepostUsersState) then) =
      _$RepostUsersStateCopyWithImpl<$Res, RepostUsersState>;
  @useResult
  $Res call({List<String> selectecUserIds});
}

/// @nodoc
class _$RepostUsersStateCopyWithImpl<$Res, $Val extends RepostUsersState>
    implements $RepostUsersStateCopyWith<$Res> {
  _$RepostUsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectecUserIds = null,
  }) {
    return _then(_value.copyWith(
      selectecUserIds: null == selectecUserIds
          ? _value.selectecUserIds
          : selectecUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedUserIdImplCopyWith<$Res>
    implements $RepostUsersStateCopyWith<$Res> {
  factory _$$SelectedUserIdImplCopyWith(_$SelectedUserIdImpl value,
          $Res Function(_$SelectedUserIdImpl) then) =
      __$$SelectedUserIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> selectecUserIds});
}

/// @nodoc
class __$$SelectedUserIdImplCopyWithImpl<$Res>
    extends _$RepostUsersStateCopyWithImpl<$Res, _$SelectedUserIdImpl>
    implements _$$SelectedUserIdImplCopyWith<$Res> {
  __$$SelectedUserIdImplCopyWithImpl(
      _$SelectedUserIdImpl _value, $Res Function(_$SelectedUserIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectecUserIds = null,
  }) {
    return _then(_$SelectedUserIdImpl(
      selectecUserIds: null == selectecUserIds
          ? _value._selectecUserIds
          : selectecUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SelectedUserIdImpl implements _SelectedUserId {
  const _$SelectedUserIdImpl({final List<String> selectecUserIds = const []})
      : _selectecUserIds = selectecUserIds;

  final List<String> _selectecUserIds;
  @override
  @JsonKey()
  List<String> get selectecUserIds {
    if (_selectecUserIds is EqualUnmodifiableListView) return _selectecUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectecUserIds);
  }

  @override
  String toString() {
    return 'RepostUsersState.selectedUserId(selectecUserIds: $selectecUserIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedUserIdImpl &&
            const DeepCollectionEquality()
                .equals(other._selectecUserIds, _selectecUserIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectecUserIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedUserIdImplCopyWith<_$SelectedUserIdImpl> get copyWith =>
      __$$SelectedUserIdImplCopyWithImpl<_$SelectedUserIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<String> selectecUserIds) selectedUserId,
  }) {
    return selectedUserId(selectecUserIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<String> selectecUserIds)? selectedUserId,
  }) {
    return selectedUserId?.call(selectecUserIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<String> selectecUserIds)? selectedUserId,
    required TResult orElse(),
  }) {
    if (selectedUserId != null) {
      return selectedUserId(selectecUserIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedUserId value) selectedUserId,
  }) {
    return selectedUserId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedUserId value)? selectedUserId,
  }) {
    return selectedUserId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedUserId value)? selectedUserId,
    required TResult orElse(),
  }) {
    if (selectedUserId != null) {
      return selectedUserId(this);
    }
    return orElse();
  }
}

abstract class _SelectedUserId implements RepostUsersState {
  const factory _SelectedUserId({final List<String> selectecUserIds}) =
      _$SelectedUserIdImpl;

  @override
  List<String> get selectecUserIds;
  @override
  @JsonKey(ignore: true)
  _$$SelectedUserIdImplCopyWith<_$SelectedUserIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
