// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'added_chat_users_group_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddedChatUsersGroupEvent {
  UserProfile get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile user) toggleSelectedUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile user)? toggleSelectedUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile user)? toggleSelectedUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectedUsers value) toggleSelectedUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectedUsers value)? toggleSelectedUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectedUsers value)? toggleSelectedUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddedChatUsersGroupEventCopyWith<AddedChatUsersGroupEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddedChatUsersGroupEventCopyWith<$Res> {
  factory $AddedChatUsersGroupEventCopyWith(AddedChatUsersGroupEvent value,
          $Res Function(AddedChatUsersGroupEvent) then) =
      _$AddedChatUsersGroupEventCopyWithImpl<$Res, AddedChatUsersGroupEvent>;
  @useResult
  $Res call({UserProfile user});

  $UserProfileCopyWith<$Res> get user;
}

/// @nodoc
class _$AddedChatUsersGroupEventCopyWithImpl<$Res,
        $Val extends AddedChatUsersGroupEvent>
    implements $AddedChatUsersGroupEventCopyWith<$Res> {
  _$AddedChatUsersGroupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get user {
    return $UserProfileCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ToggleSelectedUsersImplCopyWith<$Res>
    implements $AddedChatUsersGroupEventCopyWith<$Res> {
  factory _$$ToggleSelectedUsersImplCopyWith(_$ToggleSelectedUsersImpl value,
          $Res Function(_$ToggleSelectedUsersImpl) then) =
      __$$ToggleSelectedUsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfile user});

  @override
  $UserProfileCopyWith<$Res> get user;
}

/// @nodoc
class __$$ToggleSelectedUsersImplCopyWithImpl<$Res>
    extends _$AddedChatUsersGroupEventCopyWithImpl<$Res,
        _$ToggleSelectedUsersImpl>
    implements _$$ToggleSelectedUsersImplCopyWith<$Res> {
  __$$ToggleSelectedUsersImplCopyWithImpl(_$ToggleSelectedUsersImpl _value,
      $Res Function(_$ToggleSelectedUsersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$ToggleSelectedUsersImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }
}

/// @nodoc

class _$ToggleSelectedUsersImpl implements _ToggleSelectedUsers {
  const _$ToggleSelectedUsersImpl(this.user);

  @override
  final UserProfile user;

  @override
  String toString() {
    return 'AddedChatUsersGroupEvent.toggleSelectedUsers(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSelectedUsersImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSelectedUsersImplCopyWith<_$ToggleSelectedUsersImpl> get copyWith =>
      __$$ToggleSelectedUsersImplCopyWithImpl<_$ToggleSelectedUsersImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile user) toggleSelectedUsers,
  }) {
    return toggleSelectedUsers(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile user)? toggleSelectedUsers,
  }) {
    return toggleSelectedUsers?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile user)? toggleSelectedUsers,
    required TResult orElse(),
  }) {
    if (toggleSelectedUsers != null) {
      return toggleSelectedUsers(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelectedUsers value) toggleSelectedUsers,
  }) {
    return toggleSelectedUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelectedUsers value)? toggleSelectedUsers,
  }) {
    return toggleSelectedUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelectedUsers value)? toggleSelectedUsers,
    required TResult orElse(),
  }) {
    if (toggleSelectedUsers != null) {
      return toggleSelectedUsers(this);
    }
    return orElse();
  }
}

abstract class _ToggleSelectedUsers implements AddedChatUsersGroupEvent {
  const factory _ToggleSelectedUsers(final UserProfile user) =
      _$ToggleSelectedUsersImpl;

  @override
  UserProfile get user;
  @override
  @JsonKey(ignore: true)
  _$$ToggleSelectedUsersImplCopyWith<_$ToggleSelectedUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddedChatUsersGroupState {
  List<UserProfile> get selectedUsers => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserProfile> selectedUsers) selectedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserProfile> selectedUsers)? selectedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserProfile> selectedUsers)? selectedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedState value) selectedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedState value)? selectedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedState value)? selectedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddedChatUsersGroupStateCopyWith<AddedChatUsersGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddedChatUsersGroupStateCopyWith<$Res> {
  factory $AddedChatUsersGroupStateCopyWith(AddedChatUsersGroupState value,
          $Res Function(AddedChatUsersGroupState) then) =
      _$AddedChatUsersGroupStateCopyWithImpl<$Res, AddedChatUsersGroupState>;
  @useResult
  $Res call({List<UserProfile> selectedUsers});
}

/// @nodoc
class _$AddedChatUsersGroupStateCopyWithImpl<$Res,
        $Val extends AddedChatUsersGroupState>
    implements $AddedChatUsersGroupStateCopyWith<$Res> {
  _$AddedChatUsersGroupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUsers = null,
  }) {
    return _then(_value.copyWith(
      selectedUsers: null == selectedUsers
          ? _value.selectedUsers
          : selectedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedStateImplCopyWith<$Res>
    implements $AddedChatUsersGroupStateCopyWith<$Res> {
  factory _$$SelectedStateImplCopyWith(
          _$SelectedStateImpl value, $Res Function(_$SelectedStateImpl) then) =
      __$$SelectedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserProfile> selectedUsers});
}

/// @nodoc
class __$$SelectedStateImplCopyWithImpl<$Res>
    extends _$AddedChatUsersGroupStateCopyWithImpl<$Res, _$SelectedStateImpl>
    implements _$$SelectedStateImplCopyWith<$Res> {
  __$$SelectedStateImplCopyWithImpl(
      _$SelectedStateImpl _value, $Res Function(_$SelectedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUsers = null,
  }) {
    return _then(_$SelectedStateImpl(
      selectedUsers: null == selectedUsers
          ? _value._selectedUsers
          : selectedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ));
  }
}

/// @nodoc

class _$SelectedStateImpl implements _SelectedState {
  const _$SelectedStateImpl({final List<UserProfile> selectedUsers = const []})
      : _selectedUsers = selectedUsers;

  final List<UserProfile> _selectedUsers;
  @override
  @JsonKey()
  List<UserProfile> get selectedUsers {
    if (_selectedUsers is EqualUnmodifiableListView) return _selectedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedUsers);
  }

  @override
  String toString() {
    return 'AddedChatUsersGroupState.selectedState(selectedUsers: $selectedUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedUsers, _selectedUsers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedStateImplCopyWith<_$SelectedStateImpl> get copyWith =>
      __$$SelectedStateImplCopyWithImpl<_$SelectedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserProfile> selectedUsers) selectedState,
  }) {
    return selectedState(selectedUsers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserProfile> selectedUsers)? selectedState,
  }) {
    return selectedState?.call(selectedUsers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserProfile> selectedUsers)? selectedState,
    required TResult orElse(),
  }) {
    if (selectedState != null) {
      return selectedState(selectedUsers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedState value) selectedState,
  }) {
    return selectedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedState value)? selectedState,
  }) {
    return selectedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedState value)? selectedState,
    required TResult orElse(),
  }) {
    if (selectedState != null) {
      return selectedState(this);
    }
    return orElse();
  }
}

abstract class _SelectedState implements AddedChatUsersGroupState {
  const factory _SelectedState({final List<UserProfile> selectedUsers}) =
      _$SelectedStateImpl;

  @override
  List<UserProfile> get selectedUsers;
  @override
  @JsonKey(ignore: true)
  _$$SelectedStateImplCopyWith<_$SelectedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
