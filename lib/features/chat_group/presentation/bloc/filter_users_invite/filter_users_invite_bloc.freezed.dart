// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_users_invite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterUsersInviteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserProfile> users, String currentUid)
        loaded,
    required TResult Function(String query) searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserProfile> users, String currentUid)? loaded,
    TResult? Function(String query)? searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserProfile> users, String currentUid)? loaded,
    TResult Function(String query)? searchUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SearchUsers value) searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SearchUsers value)? searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SearchUsers value)? searchUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterUsersInviteEventCopyWith<$Res> {
  factory $FilterUsersInviteEventCopyWith(FilterUsersInviteEvent value,
          $Res Function(FilterUsersInviteEvent) then) =
      _$FilterUsersInviteEventCopyWithImpl<$Res, FilterUsersInviteEvent>;
}

/// @nodoc
class _$FilterUsersInviteEventCopyWithImpl<$Res,
        $Val extends FilterUsersInviteEvent>
    implements $FilterUsersInviteEventCopyWith<$Res> {
  _$FilterUsersInviteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserProfile> users, String currentUid});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$FilterUsersInviteEventCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? currentUid = null,
  }) {
    return _then(_$LoadedImpl(
      null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
      null == currentUid
          ? _value.currentUid
          : currentUid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<UserProfile> users, this.currentUid)
      : _users = users;

  final List<UserProfile> _users;
  @override
  List<UserProfile> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final String currentUid;

  @override
  String toString() {
    return 'FilterUsersInviteEvent.loaded(users: $users, currentUid: $currentUid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.currentUid, currentUid) ||
                other.currentUid == currentUid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_users), currentUid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserProfile> users, String currentUid)
        loaded,
    required TResult Function(String query) searchUsers,
  }) {
    return loaded(users, currentUid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserProfile> users, String currentUid)? loaded,
    TResult? Function(String query)? searchUsers,
  }) {
    return loaded?.call(users, currentUid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserProfile> users, String currentUid)? loaded,
    TResult Function(String query)? searchUsers,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(users, currentUid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SearchUsers value) searchUsers,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SearchUsers value)? searchUsers,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SearchUsers value)? searchUsers,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements FilterUsersInviteEvent {
  const factory _Loaded(
      final List<UserProfile> users, final String currentUid) = _$LoadedImpl;

  List<UserProfile> get users;
  String get currentUid;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchUsersImplCopyWith<$Res> {
  factory _$$SearchUsersImplCopyWith(
          _$SearchUsersImpl value, $Res Function(_$SearchUsersImpl) then) =
      __$$SearchUsersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchUsersImplCopyWithImpl<$Res>
    extends _$FilterUsersInviteEventCopyWithImpl<$Res, _$SearchUsersImpl>
    implements _$$SearchUsersImplCopyWith<$Res> {
  __$$SearchUsersImplCopyWithImpl(
      _$SearchUsersImpl _value, $Res Function(_$SearchUsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchUsersImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchUsersImpl implements _SearchUsers {
  const _$SearchUsersImpl({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'FilterUsersInviteEvent.searchUsers(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUsersImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUsersImplCopyWith<_$SearchUsersImpl> get copyWith =>
      __$$SearchUsersImplCopyWithImpl<_$SearchUsersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserProfile> users, String currentUid)
        loaded,
    required TResult Function(String query) searchUsers,
  }) {
    return searchUsers(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserProfile> users, String currentUid)? loaded,
    TResult? Function(String query)? searchUsers,
  }) {
    return searchUsers?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserProfile> users, String currentUid)? loaded,
    TResult Function(String query)? searchUsers,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_SearchUsers value) searchUsers,
  }) {
    return searchUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_SearchUsers value)? searchUsers,
  }) {
    return searchUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    TResult Function(_SearchUsers value)? searchUsers,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(this);
    }
    return orElse();
  }
}

abstract class _SearchUsers implements FilterUsersInviteEvent {
  const factory _SearchUsers({required final String query}) = _$SearchUsersImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchUsersImplCopyWith<_$SearchUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FilterUsersInviteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<UserProfile> filterUsers) filterUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserProfile> filterUsers)? filterUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserProfile> filterUsers)? filterUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FilterUsers value) filterUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FilterUsers value)? filterUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FilterUsers value)? filterUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterUsersInviteStateCopyWith<$Res> {
  factory $FilterUsersInviteStateCopyWith(FilterUsersInviteState value,
          $Res Function(FilterUsersInviteState) then) =
      _$FilterUsersInviteStateCopyWithImpl<$Res, FilterUsersInviteState>;
}

/// @nodoc
class _$FilterUsersInviteStateCopyWithImpl<$Res,
        $Val extends FilterUsersInviteState>
    implements $FilterUsersInviteStateCopyWith<$Res> {
  _$FilterUsersInviteStateCopyWithImpl(this._value, this._then);

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
    extends _$FilterUsersInviteStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'FilterUsersInviteState.initial()';
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
    required TResult Function(List<UserProfile> filterUsers) filterUsers,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserProfile> filterUsers)? filterUsers,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserProfile> filterUsers)? filterUsers,
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
    required TResult Function(_FilterUsers value) filterUsers,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FilterUsers value)? filterUsers,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FilterUsers value)? filterUsers,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FilterUsersInviteState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$FilterUsersImplCopyWith<$Res> {
  factory _$$FilterUsersImplCopyWith(
          _$FilterUsersImpl value, $Res Function(_$FilterUsersImpl) then) =
      __$$FilterUsersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserProfile> filterUsers});
}

/// @nodoc
class __$$FilterUsersImplCopyWithImpl<$Res>
    extends _$FilterUsersInviteStateCopyWithImpl<$Res, _$FilterUsersImpl>
    implements _$$FilterUsersImplCopyWith<$Res> {
  __$$FilterUsersImplCopyWithImpl(
      _$FilterUsersImpl _value, $Res Function(_$FilterUsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterUsers = null,
  }) {
    return _then(_$FilterUsersImpl(
      null == filterUsers
          ? _value._filterUsers
          : filterUsers // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ));
  }
}

/// @nodoc

class _$FilterUsersImpl implements _FilterUsers {
  const _$FilterUsersImpl(final List<UserProfile> filterUsers)
      : _filterUsers = filterUsers;

  final List<UserProfile> _filterUsers;
  @override
  List<UserProfile> get filterUsers {
    if (_filterUsers is EqualUnmodifiableListView) return _filterUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterUsers);
  }

  @override
  String toString() {
    return 'FilterUsersInviteState.filterUsers(filterUsers: $filterUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterUsersImpl &&
            const DeepCollectionEquality()
                .equals(other._filterUsers, _filterUsers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_filterUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterUsersImplCopyWith<_$FilterUsersImpl> get copyWith =>
      __$$FilterUsersImplCopyWithImpl<_$FilterUsersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<UserProfile> filterUsers) filterUsers,
  }) {
    return filterUsers(this.filterUsers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserProfile> filterUsers)? filterUsers,
  }) {
    return filterUsers?.call(this.filterUsers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserProfile> filterUsers)? filterUsers,
    required TResult orElse(),
  }) {
    if (filterUsers != null) {
      return filterUsers(this.filterUsers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_FilterUsers value) filterUsers,
  }) {
    return filterUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_FilterUsers value)? filterUsers,
  }) {
    return filterUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_FilterUsers value)? filterUsers,
    required TResult orElse(),
  }) {
    if (filterUsers != null) {
      return filterUsers(this);
    }
    return orElse();
  }
}

abstract class _FilterUsers implements FilterUsersInviteState {
  const factory _FilterUsers(final List<UserProfile> filterUsers) =
      _$FilterUsersImpl;

  List<UserProfile> get filterUsers;
  @JsonKey(ignore: true)
  _$$FilterUsersImplCopyWith<_$FilterUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
