// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_admins_sorted_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAdminsSortedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile owner,
            List<UserProfile> administrators, List<UserProfile> editors)
        sortAdmins,
    required TResult Function(String query) searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile owner, List<UserProfile> administrators,
            List<UserProfile> editors)?
        sortAdmins,
    TResult? Function(String query)? searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile owner, List<UserProfile> administrators,
            List<UserProfile> editors)?
        sortAdmins,
    TResult Function(String query)? searchUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SortAdmins value) sortAdmins,
    required TResult Function(_SearchUsers value) searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SortAdmins value)? sortAdmins,
    TResult? Function(_SearchUsers value)? searchUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SortAdmins value)? sortAdmins,
    TResult Function(_SearchUsers value)? searchUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAdminsSortedEventCopyWith<$Res> {
  factory $GetAdminsSortedEventCopyWith(GetAdminsSortedEvent value,
          $Res Function(GetAdminsSortedEvent) then) =
      _$GetAdminsSortedEventCopyWithImpl<$Res, GetAdminsSortedEvent>;
}

/// @nodoc
class _$GetAdminsSortedEventCopyWithImpl<$Res,
        $Val extends GetAdminsSortedEvent>
    implements $GetAdminsSortedEventCopyWith<$Res> {
  _$GetAdminsSortedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SortAdminsImplCopyWith<$Res> {
  factory _$$SortAdminsImplCopyWith(
          _$SortAdminsImpl value, $Res Function(_$SortAdminsImpl) then) =
      __$$SortAdminsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {UserProfile owner,
      List<UserProfile> administrators,
      List<UserProfile> editors});

  $UserProfileCopyWith<$Res> get owner;
}

/// @nodoc
class __$$SortAdminsImplCopyWithImpl<$Res>
    extends _$GetAdminsSortedEventCopyWithImpl<$Res, _$SortAdminsImpl>
    implements _$$SortAdminsImplCopyWith<$Res> {
  __$$SortAdminsImplCopyWithImpl(
      _$SortAdminsImpl _value, $Res Function(_$SortAdminsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? administrators = null,
    Object? editors = null,
  }) {
    return _then(_$SortAdminsImpl(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      administrators: null == administrators
          ? _value._administrators
          : administrators // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
      editors: null == editors
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get owner {
    return $UserProfileCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value));
    });
  }
}

/// @nodoc

class _$SortAdminsImpl implements _SortAdmins {
  const _$SortAdminsImpl(
      {required this.owner,
      required final List<UserProfile> administrators,
      required final List<UserProfile> editors})
      : _administrators = administrators,
        _editors = editors;

  @override
  final UserProfile owner;
  final List<UserProfile> _administrators;
  @override
  List<UserProfile> get administrators {
    if (_administrators is EqualUnmodifiableListView) return _administrators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_administrators);
  }

  final List<UserProfile> _editors;
  @override
  List<UserProfile> get editors {
    if (_editors is EqualUnmodifiableListView) return _editors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editors);
  }

  @override
  String toString() {
    return 'GetAdminsSortedEvent.sortAdmins(owner: $owner, administrators: $administrators, editors: $editors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortAdminsImpl &&
            (identical(other.owner, owner) || other.owner == owner) &&
            const DeepCollectionEquality()
                .equals(other._administrators, _administrators) &&
            const DeepCollectionEquality().equals(other._editors, _editors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      owner,
      const DeepCollectionEquality().hash(_administrators),
      const DeepCollectionEquality().hash(_editors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SortAdminsImplCopyWith<_$SortAdminsImpl> get copyWith =>
      __$$SortAdminsImplCopyWithImpl<_$SortAdminsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile owner,
            List<UserProfile> administrators, List<UserProfile> editors)
        sortAdmins,
    required TResult Function(String query) searchUsers,
  }) {
    return sortAdmins(owner, administrators, editors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile owner, List<UserProfile> administrators,
            List<UserProfile> editors)?
        sortAdmins,
    TResult? Function(String query)? searchUsers,
  }) {
    return sortAdmins?.call(owner, administrators, editors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile owner, List<UserProfile> administrators,
            List<UserProfile> editors)?
        sortAdmins,
    TResult Function(String query)? searchUsers,
    required TResult orElse(),
  }) {
    if (sortAdmins != null) {
      return sortAdmins(owner, administrators, editors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SortAdmins value) sortAdmins,
    required TResult Function(_SearchUsers value) searchUsers,
  }) {
    return sortAdmins(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SortAdmins value)? sortAdmins,
    TResult? Function(_SearchUsers value)? searchUsers,
  }) {
    return sortAdmins?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SortAdmins value)? sortAdmins,
    TResult Function(_SearchUsers value)? searchUsers,
    required TResult orElse(),
  }) {
    if (sortAdmins != null) {
      return sortAdmins(this);
    }
    return orElse();
  }
}

abstract class _SortAdmins implements GetAdminsSortedEvent {
  const factory _SortAdmins(
      {required final UserProfile owner,
      required final List<UserProfile> administrators,
      required final List<UserProfile> editors}) = _$SortAdminsImpl;

  UserProfile get owner;
  List<UserProfile> get administrators;
  List<UserProfile> get editors;
  @JsonKey(ignore: true)
  _$$SortAdminsImplCopyWith<_$SortAdminsImpl> get copyWith =>
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
    extends _$GetAdminsSortedEventCopyWithImpl<$Res, _$SearchUsersImpl>
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
    return 'GetAdminsSortedEvent.searchUsers(query: $query)';
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
    required TResult Function(UserProfile owner,
            List<UserProfile> administrators, List<UserProfile> editors)
        sortAdmins,
    required TResult Function(String query) searchUsers,
  }) {
    return searchUsers(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile owner, List<UserProfile> administrators,
            List<UserProfile> editors)?
        sortAdmins,
    TResult? Function(String query)? searchUsers,
  }) {
    return searchUsers?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile owner, List<UserProfile> administrators,
            List<UserProfile> editors)?
        sortAdmins,
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
    required TResult Function(_SortAdmins value) sortAdmins,
    required TResult Function(_SearchUsers value) searchUsers,
  }) {
    return searchUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SortAdmins value)? sortAdmins,
    TResult? Function(_SearchUsers value)? searchUsers,
  }) {
    return searchUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SortAdmins value)? sortAdmins,
    TResult Function(_SearchUsers value)? searchUsers,
    required TResult orElse(),
  }) {
    if (searchUsers != null) {
      return searchUsers(this);
    }
    return orElse();
  }
}

abstract class _SearchUsers implements GetAdminsSortedEvent {
  const factory _SearchUsers({required final String query}) = _$SearchUsersImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchUsersImplCopyWith<_$SearchUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetAdminsSortedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<UserProfile> sortedAdmins) sorted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserProfile> sortedAdmins)? sorted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserProfile> sortedAdmins)? sorted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Sorted value) sorted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Sorted value)? sorted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Sorted value)? sorted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAdminsSortedStateCopyWith<$Res> {
  factory $GetAdminsSortedStateCopyWith(GetAdminsSortedState value,
          $Res Function(GetAdminsSortedState) then) =
      _$GetAdminsSortedStateCopyWithImpl<$Res, GetAdminsSortedState>;
}

/// @nodoc
class _$GetAdminsSortedStateCopyWithImpl<$Res,
        $Val extends GetAdminsSortedState>
    implements $GetAdminsSortedStateCopyWith<$Res> {
  _$GetAdminsSortedStateCopyWithImpl(this._value, this._then);

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
    extends _$GetAdminsSortedStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'GetAdminsSortedState.initial()';
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
    required TResult Function(List<UserProfile> sortedAdmins) sorted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserProfile> sortedAdmins)? sorted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserProfile> sortedAdmins)? sorted,
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
    required TResult Function(_Sorted value) sorted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Sorted value)? sorted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Sorted value)? sorted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements GetAdminsSortedState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SortedImplCopyWith<$Res> {
  factory _$$SortedImplCopyWith(
          _$SortedImpl value, $Res Function(_$SortedImpl) then) =
      __$$SortedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserProfile> sortedAdmins});
}

/// @nodoc
class __$$SortedImplCopyWithImpl<$Res>
    extends _$GetAdminsSortedStateCopyWithImpl<$Res, _$SortedImpl>
    implements _$$SortedImplCopyWith<$Res> {
  __$$SortedImplCopyWithImpl(
      _$SortedImpl _value, $Res Function(_$SortedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortedAdmins = null,
  }) {
    return _then(_$SortedImpl(
      null == sortedAdmins
          ? _value._sortedAdmins
          : sortedAdmins // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ));
  }
}

/// @nodoc

class _$SortedImpl implements _Sorted {
  const _$SortedImpl(final List<UserProfile> sortedAdmins)
      : _sortedAdmins = sortedAdmins;

  final List<UserProfile> _sortedAdmins;
  @override
  List<UserProfile> get sortedAdmins {
    if (_sortedAdmins is EqualUnmodifiableListView) return _sortedAdmins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sortedAdmins);
  }

  @override
  String toString() {
    return 'GetAdminsSortedState.sorted(sortedAdmins: $sortedAdmins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortedImpl &&
            const DeepCollectionEquality()
                .equals(other._sortedAdmins, _sortedAdmins));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_sortedAdmins));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SortedImplCopyWith<_$SortedImpl> get copyWith =>
      __$$SortedImplCopyWithImpl<_$SortedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<UserProfile> sortedAdmins) sorted,
  }) {
    return sorted(sortedAdmins);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<UserProfile> sortedAdmins)? sorted,
  }) {
    return sorted?.call(sortedAdmins);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<UserProfile> sortedAdmins)? sorted,
    required TResult orElse(),
  }) {
    if (sorted != null) {
      return sorted(sortedAdmins);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Sorted value) sorted,
  }) {
    return sorted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Sorted value)? sorted,
  }) {
    return sorted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Sorted value)? sorted,
    required TResult orElse(),
  }) {
    if (sorted != null) {
      return sorted(this);
    }
    return orElse();
  }
}

abstract class _Sorted implements GetAdminsSortedState {
  const factory _Sorted(final List<UserProfile> sortedAdmins) = _$SortedImpl;

  List<UserProfile> get sortedAdmins;
  @JsonKey(ignore: true)
  _$$SortedImplCopyWith<_$SortedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
