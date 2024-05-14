// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_people_chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvitePeopleChatEvent {
  UserProfile get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile user) toggleUserSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile user)? toggleUserSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile user)? toggleUserSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleUserSelection value) toggleUserSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleUserSelection value)? toggleUserSelection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleUserSelection value)? toggleUserSelection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvitePeopleChatEventCopyWith<InvitePeopleChatEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitePeopleChatEventCopyWith<$Res> {
  factory $InvitePeopleChatEventCopyWith(InvitePeopleChatEvent value,
          $Res Function(InvitePeopleChatEvent) then) =
      _$InvitePeopleChatEventCopyWithImpl<$Res, InvitePeopleChatEvent>;
  @useResult
  $Res call({UserProfile user});

  $UserProfileCopyWith<$Res> get user;
}

/// @nodoc
class _$InvitePeopleChatEventCopyWithImpl<$Res,
        $Val extends InvitePeopleChatEvent>
    implements $InvitePeopleChatEventCopyWith<$Res> {
  _$InvitePeopleChatEventCopyWithImpl(this._value, this._then);

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
abstract class _$$ToggleUserSelectionImplCopyWith<$Res>
    implements $InvitePeopleChatEventCopyWith<$Res> {
  factory _$$ToggleUserSelectionImplCopyWith(_$ToggleUserSelectionImpl value,
          $Res Function(_$ToggleUserSelectionImpl) then) =
      __$$ToggleUserSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfile user});

  @override
  $UserProfileCopyWith<$Res> get user;
}

/// @nodoc
class __$$ToggleUserSelectionImplCopyWithImpl<$Res>
    extends _$InvitePeopleChatEventCopyWithImpl<$Res, _$ToggleUserSelectionImpl>
    implements _$$ToggleUserSelectionImplCopyWith<$Res> {
  __$$ToggleUserSelectionImplCopyWithImpl(_$ToggleUserSelectionImpl _value,
      $Res Function(_$ToggleUserSelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$ToggleUserSelectionImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserProfile,
    ));
  }
}

/// @nodoc

class _$ToggleUserSelectionImpl implements _ToggleUserSelection {
  const _$ToggleUserSelectionImpl(this.user);

  @override
  final UserProfile user;

  @override
  String toString() {
    return 'InvitePeopleChatEvent.toggleUserSelection(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleUserSelectionImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleUserSelectionImplCopyWith<_$ToggleUserSelectionImpl> get copyWith =>
      __$$ToggleUserSelectionImplCopyWithImpl<_$ToggleUserSelectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserProfile user) toggleUserSelection,
  }) {
    return toggleUserSelection(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserProfile user)? toggleUserSelection,
  }) {
    return toggleUserSelection?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserProfile user)? toggleUserSelection,
    required TResult orElse(),
  }) {
    if (toggleUserSelection != null) {
      return toggleUserSelection(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleUserSelection value) toggleUserSelection,
  }) {
    return toggleUserSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleUserSelection value)? toggleUserSelection,
  }) {
    return toggleUserSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleUserSelection value)? toggleUserSelection,
    required TResult orElse(),
  }) {
    if (toggleUserSelection != null) {
      return toggleUserSelection(this);
    }
    return orElse();
  }
}

abstract class _ToggleUserSelection implements InvitePeopleChatEvent {
  const factory _ToggleUserSelection(final UserProfile user) =
      _$ToggleUserSelectionImpl;

  @override
  UserProfile get user;
  @override
  @JsonKey(ignore: true)
  _$$ToggleUserSelectionImplCopyWith<_$ToggleUserSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InvitePeopleChatState {
  List<UserProfile> get selectedUsers => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserProfile> selectedUsers) selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserProfile> selectedUsers)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserProfile> selectedUsers)? selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Selected value) selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Selected value)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Selected value)? selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvitePeopleChatStateCopyWith<InvitePeopleChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitePeopleChatStateCopyWith<$Res> {
  factory $InvitePeopleChatStateCopyWith(InvitePeopleChatState value,
          $Res Function(InvitePeopleChatState) then) =
      _$InvitePeopleChatStateCopyWithImpl<$Res, InvitePeopleChatState>;
  @useResult
  $Res call({List<UserProfile> selectedUsers});
}

/// @nodoc
class _$InvitePeopleChatStateCopyWithImpl<$Res,
        $Val extends InvitePeopleChatState>
    implements $InvitePeopleChatStateCopyWith<$Res> {
  _$InvitePeopleChatStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SelectedImplCopyWith<$Res>
    implements $InvitePeopleChatStateCopyWith<$Res> {
  factory _$$SelectedImplCopyWith(
          _$SelectedImpl value, $Res Function(_$SelectedImpl) then) =
      __$$SelectedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserProfile> selectedUsers});
}

/// @nodoc
class __$$SelectedImplCopyWithImpl<$Res>
    extends _$InvitePeopleChatStateCopyWithImpl<$Res, _$SelectedImpl>
    implements _$$SelectedImplCopyWith<$Res> {
  __$$SelectedImplCopyWithImpl(
      _$SelectedImpl _value, $Res Function(_$SelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedUsers = null,
  }) {
    return _then(_$SelectedImpl(
      selectedUsers: null == selectedUsers
          ? _value._selectedUsers
          : selectedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserProfile>,
    ));
  }
}

/// @nodoc

class _$SelectedImpl implements _Selected {
  const _$SelectedImpl({final List<UserProfile> selectedUsers = const []})
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
    return 'InvitePeopleChatState.selected(selectedUsers: $selectedUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedUsers, _selectedUsers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedImplCopyWith<_$SelectedImpl> get copyWith =>
      __$$SelectedImplCopyWithImpl<_$SelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<UserProfile> selectedUsers) selected,
  }) {
    return selected(selectedUsers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<UserProfile> selectedUsers)? selected,
  }) {
    return selected?.call(selectedUsers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<UserProfile> selectedUsers)? selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(selectedUsers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Selected value) selected,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Selected value)? selected,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Selected value)? selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class _Selected implements InvitePeopleChatState {
  const factory _Selected({final List<UserProfile> selectedUsers}) =
      _$SelectedImpl;

  @override
  List<UserProfile> get selectedUsers;
  @override
  @JsonKey(ignore: true)
  _$$SelectedImplCopyWith<_$SelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
