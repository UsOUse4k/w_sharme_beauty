// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_group_check_manager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatGroupCheckManagerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) editManagerAdministrator,
    required TResult Function(String userId) editManagerEditor,
    required TResult Function(
            List<String> administrator, List<String> editors, String groupId)
        getAllAdministrator,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? editManagerAdministrator,
    TResult? Function(String userId)? editManagerEditor,
    TResult? Function(
            List<String> administrator, List<String> editors, String groupId)?
        getAllAdministrator,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? editManagerAdministrator,
    TResult Function(String userId)? editManagerEditor,
    TResult Function(
            List<String> administrator, List<String> editors, String groupId)?
        getAllAdministrator,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditManagerAdministrator value)
        editManagerAdministrator,
    required TResult Function(_EditManagerEditor value) editManagerEditor,
    required TResult Function(_GetAllAdministrator value) getAllAdministrator,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditManagerAdministrator value)?
        editManagerAdministrator,
    TResult? Function(_EditManagerEditor value)? editManagerEditor,
    TResult? Function(_GetAllAdministrator value)? getAllAdministrator,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditManagerAdministrator value)? editManagerAdministrator,
    TResult Function(_EditManagerEditor value)? editManagerEditor,
    TResult Function(_GetAllAdministrator value)? getAllAdministrator,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGroupCheckManagerEventCopyWith<$Res> {
  factory $ChatGroupCheckManagerEventCopyWith(ChatGroupCheckManagerEvent value,
          $Res Function(ChatGroupCheckManagerEvent) then) =
      _$ChatGroupCheckManagerEventCopyWithImpl<$Res,
          ChatGroupCheckManagerEvent>;
}

/// @nodoc
class _$ChatGroupCheckManagerEventCopyWithImpl<$Res,
        $Val extends ChatGroupCheckManagerEvent>
    implements $ChatGroupCheckManagerEventCopyWith<$Res> {
  _$ChatGroupCheckManagerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditManagerAdministratorImplCopyWith<$Res> {
  factory _$$EditManagerAdministratorImplCopyWith(
          _$EditManagerAdministratorImpl value,
          $Res Function(_$EditManagerAdministratorImpl) then) =
      __$$EditManagerAdministratorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$EditManagerAdministratorImplCopyWithImpl<$Res>
    extends _$ChatGroupCheckManagerEventCopyWithImpl<$Res,
        _$EditManagerAdministratorImpl>
    implements _$$EditManagerAdministratorImplCopyWith<$Res> {
  __$$EditManagerAdministratorImplCopyWithImpl(
      _$EditManagerAdministratorImpl _value,
      $Res Function(_$EditManagerAdministratorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$EditManagerAdministratorImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditManagerAdministratorImpl implements _EditManagerAdministrator {
  const _$EditManagerAdministratorImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'ChatGroupCheckManagerEvent.editManagerAdministrator(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditManagerAdministratorImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditManagerAdministratorImplCopyWith<_$EditManagerAdministratorImpl>
      get copyWith => __$$EditManagerAdministratorImplCopyWithImpl<
          _$EditManagerAdministratorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) editManagerAdministrator,
    required TResult Function(String userId) editManagerEditor,
    required TResult Function(
            List<String> administrator, List<String> editors, String groupId)
        getAllAdministrator,
  }) {
    return editManagerAdministrator(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? editManagerAdministrator,
    TResult? Function(String userId)? editManagerEditor,
    TResult? Function(
            List<String> administrator, List<String> editors, String groupId)?
        getAllAdministrator,
  }) {
    return editManagerAdministrator?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? editManagerAdministrator,
    TResult Function(String userId)? editManagerEditor,
    TResult Function(
            List<String> administrator, List<String> editors, String groupId)?
        getAllAdministrator,
    required TResult orElse(),
  }) {
    if (editManagerAdministrator != null) {
      return editManagerAdministrator(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditManagerAdministrator value)
        editManagerAdministrator,
    required TResult Function(_EditManagerEditor value) editManagerEditor,
    required TResult Function(_GetAllAdministrator value) getAllAdministrator,
  }) {
    return editManagerAdministrator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditManagerAdministrator value)?
        editManagerAdministrator,
    TResult? Function(_EditManagerEditor value)? editManagerEditor,
    TResult? Function(_GetAllAdministrator value)? getAllAdministrator,
  }) {
    return editManagerAdministrator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditManagerAdministrator value)? editManagerAdministrator,
    TResult Function(_EditManagerEditor value)? editManagerEditor,
    TResult Function(_GetAllAdministrator value)? getAllAdministrator,
    required TResult orElse(),
  }) {
    if (editManagerAdministrator != null) {
      return editManagerAdministrator(this);
    }
    return orElse();
  }
}

abstract class _EditManagerAdministrator implements ChatGroupCheckManagerEvent {
  const factory _EditManagerAdministrator({required final String userId}) =
      _$EditManagerAdministratorImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$EditManagerAdministratorImplCopyWith<_$EditManagerAdministratorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditManagerEditorImplCopyWith<$Res> {
  factory _$$EditManagerEditorImplCopyWith(_$EditManagerEditorImpl value,
          $Res Function(_$EditManagerEditorImpl) then) =
      __$$EditManagerEditorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$EditManagerEditorImplCopyWithImpl<$Res>
    extends _$ChatGroupCheckManagerEventCopyWithImpl<$Res,
        _$EditManagerEditorImpl>
    implements _$$EditManagerEditorImplCopyWith<$Res> {
  __$$EditManagerEditorImplCopyWithImpl(_$EditManagerEditorImpl _value,
      $Res Function(_$EditManagerEditorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$EditManagerEditorImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditManagerEditorImpl implements _EditManagerEditor {
  const _$EditManagerEditorImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'ChatGroupCheckManagerEvent.editManagerEditor(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditManagerEditorImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditManagerEditorImplCopyWith<_$EditManagerEditorImpl> get copyWith =>
      __$$EditManagerEditorImplCopyWithImpl<_$EditManagerEditorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) editManagerAdministrator,
    required TResult Function(String userId) editManagerEditor,
    required TResult Function(
            List<String> administrator, List<String> editors, String groupId)
        getAllAdministrator,
  }) {
    return editManagerEditor(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? editManagerAdministrator,
    TResult? Function(String userId)? editManagerEditor,
    TResult? Function(
            List<String> administrator, List<String> editors, String groupId)?
        getAllAdministrator,
  }) {
    return editManagerEditor?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? editManagerAdministrator,
    TResult Function(String userId)? editManagerEditor,
    TResult Function(
            List<String> administrator, List<String> editors, String groupId)?
        getAllAdministrator,
    required TResult orElse(),
  }) {
    if (editManagerEditor != null) {
      return editManagerEditor(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditManagerAdministrator value)
        editManagerAdministrator,
    required TResult Function(_EditManagerEditor value) editManagerEditor,
    required TResult Function(_GetAllAdministrator value) getAllAdministrator,
  }) {
    return editManagerEditor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditManagerAdministrator value)?
        editManagerAdministrator,
    TResult? Function(_EditManagerEditor value)? editManagerEditor,
    TResult? Function(_GetAllAdministrator value)? getAllAdministrator,
  }) {
    return editManagerEditor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditManagerAdministrator value)? editManagerAdministrator,
    TResult Function(_EditManagerEditor value)? editManagerEditor,
    TResult Function(_GetAllAdministrator value)? getAllAdministrator,
    required TResult orElse(),
  }) {
    if (editManagerEditor != null) {
      return editManagerEditor(this);
    }
    return orElse();
  }
}

abstract class _EditManagerEditor implements ChatGroupCheckManagerEvent {
  const factory _EditManagerEditor({required final String userId}) =
      _$EditManagerEditorImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$EditManagerEditorImplCopyWith<_$EditManagerEditorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllAdministratorImplCopyWith<$Res> {
  factory _$$GetAllAdministratorImplCopyWith(_$GetAllAdministratorImpl value,
          $Res Function(_$GetAllAdministratorImpl) then) =
      __$$GetAllAdministratorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> administrator, List<String> editors, String groupId});
}

/// @nodoc
class __$$GetAllAdministratorImplCopyWithImpl<$Res>
    extends _$ChatGroupCheckManagerEventCopyWithImpl<$Res,
        _$GetAllAdministratorImpl>
    implements _$$GetAllAdministratorImplCopyWith<$Res> {
  __$$GetAllAdministratorImplCopyWithImpl(_$GetAllAdministratorImpl _value,
      $Res Function(_$GetAllAdministratorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? administrator = null,
    Object? editors = null,
    Object? groupId = null,
  }) {
    return _then(_$GetAllAdministratorImpl(
      administrator: null == administrator
          ? _value._administrator
          : administrator // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAllAdministratorImpl implements _GetAllAdministrator {
  const _$GetAllAdministratorImpl(
      {required final List<String> administrator,
      required final List<String> editors,
      required this.groupId})
      : _administrator = administrator,
        _editors = editors;

  final List<String> _administrator;
  @override
  List<String> get administrator {
    if (_administrator is EqualUnmodifiableListView) return _administrator;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_administrator);
  }

  final List<String> _editors;
  @override
  List<String> get editors {
    if (_editors is EqualUnmodifiableListView) return _editors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editors);
  }

  @override
  final String groupId;

  @override
  String toString() {
    return 'ChatGroupCheckManagerEvent.getAllAdministrator(administrator: $administrator, editors: $editors, groupId: $groupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllAdministratorImpl &&
            const DeepCollectionEquality()
                .equals(other._administrator, _administrator) &&
            const DeepCollectionEquality().equals(other._editors, _editors) &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_administrator),
      const DeepCollectionEquality().hash(_editors),
      groupId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllAdministratorImplCopyWith<_$GetAllAdministratorImpl> get copyWith =>
      __$$GetAllAdministratorImplCopyWithImpl<_$GetAllAdministratorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) editManagerAdministrator,
    required TResult Function(String userId) editManagerEditor,
    required TResult Function(
            List<String> administrator, List<String> editors, String groupId)
        getAllAdministrator,
  }) {
    return getAllAdministrator(administrator, editors, groupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? editManagerAdministrator,
    TResult? Function(String userId)? editManagerEditor,
    TResult? Function(
            List<String> administrator, List<String> editors, String groupId)?
        getAllAdministrator,
  }) {
    return getAllAdministrator?.call(administrator, editors, groupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? editManagerAdministrator,
    TResult Function(String userId)? editManagerEditor,
    TResult Function(
            List<String> administrator, List<String> editors, String groupId)?
        getAllAdministrator,
    required TResult orElse(),
  }) {
    if (getAllAdministrator != null) {
      return getAllAdministrator(administrator, editors, groupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditManagerAdministrator value)
        editManagerAdministrator,
    required TResult Function(_EditManagerEditor value) editManagerEditor,
    required TResult Function(_GetAllAdministrator value) getAllAdministrator,
  }) {
    return getAllAdministrator(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditManagerAdministrator value)?
        editManagerAdministrator,
    TResult? Function(_EditManagerEditor value)? editManagerEditor,
    TResult? Function(_GetAllAdministrator value)? getAllAdministrator,
  }) {
    return getAllAdministrator?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditManagerAdministrator value)? editManagerAdministrator,
    TResult Function(_EditManagerEditor value)? editManagerEditor,
    TResult Function(_GetAllAdministrator value)? getAllAdministrator,
    required TResult orElse(),
  }) {
    if (getAllAdministrator != null) {
      return getAllAdministrator(this);
    }
    return orElse();
  }
}

abstract class _GetAllAdministrator implements ChatGroupCheckManagerEvent {
  const factory _GetAllAdministrator(
      {required final List<String> administrator,
      required final List<String> editors,
      required final String groupId}) = _$GetAllAdministratorImpl;

  List<String> get administrator;
  List<String> get editors;
  String get groupId;
  @JsonKey(ignore: true)
  _$$GetAllAdministratorImplCopyWith<_$GetAllAdministratorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatGroupCheckManagerState {
  List<String> get administrator => throw _privateConstructorUsedError;
  List<String> get editors => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String> administrator, List<String> editors, String groupId)
        selectedManager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<String> administrator, List<String> editors, String groupId)?
        selectedManager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<String> administrator, List<String> editors, String groupId)?
        selectedManager,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedManager value) selectedManager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedManager value)? selectedManager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedManager value)? selectedManager,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatGroupCheckManagerStateCopyWith<ChatGroupCheckManagerState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGroupCheckManagerStateCopyWith<$Res> {
  factory $ChatGroupCheckManagerStateCopyWith(ChatGroupCheckManagerState value,
          $Res Function(ChatGroupCheckManagerState) then) =
      _$ChatGroupCheckManagerStateCopyWithImpl<$Res,
          ChatGroupCheckManagerState>;
  @useResult
  $Res call({List<String> administrator, List<String> editors, String groupId});
}

/// @nodoc
class _$ChatGroupCheckManagerStateCopyWithImpl<$Res,
        $Val extends ChatGroupCheckManagerState>
    implements $ChatGroupCheckManagerStateCopyWith<$Res> {
  _$ChatGroupCheckManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? administrator = null,
    Object? editors = null,
    Object? groupId = null,
  }) {
    return _then(_value.copyWith(
      administrator: null == administrator
          ? _value.administrator
          : administrator // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value.editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedManagerImplCopyWith<$Res>
    implements $ChatGroupCheckManagerStateCopyWith<$Res> {
  factory _$$SelectedManagerImplCopyWith(_$SelectedManagerImpl value,
          $Res Function(_$SelectedManagerImpl) then) =
      __$$SelectedManagerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> administrator, List<String> editors, String groupId});
}

/// @nodoc
class __$$SelectedManagerImplCopyWithImpl<$Res>
    extends _$ChatGroupCheckManagerStateCopyWithImpl<$Res,
        _$SelectedManagerImpl> implements _$$SelectedManagerImplCopyWith<$Res> {
  __$$SelectedManagerImplCopyWithImpl(
      _$SelectedManagerImpl _value, $Res Function(_$SelectedManagerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? administrator = null,
    Object? editors = null,
    Object? groupId = null,
  }) {
    return _then(_$SelectedManagerImpl(
      administrator: null == administrator
          ? _value._administrator
          : administrator // ignore: cast_nullable_to_non_nullable
              as List<String>,
      editors: null == editors
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedManagerImpl implements _SelectedManager {
  const _$SelectedManagerImpl(
      {final List<String> administrator = const [],
      final List<String> editors = const [],
      this.groupId = ''})
      : _administrator = administrator,
        _editors = editors;

  final List<String> _administrator;
  @override
  @JsonKey()
  List<String> get administrator {
    if (_administrator is EqualUnmodifiableListView) return _administrator;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_administrator);
  }

  final List<String> _editors;
  @override
  @JsonKey()
  List<String> get editors {
    if (_editors is EqualUnmodifiableListView) return _editors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editors);
  }

  @override
  @JsonKey()
  final String groupId;

  @override
  String toString() {
    return 'ChatGroupCheckManagerState.selectedManager(administrator: $administrator, editors: $editors, groupId: $groupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedManagerImpl &&
            const DeepCollectionEquality()
                .equals(other._administrator, _administrator) &&
            const DeepCollectionEquality().equals(other._editors, _editors) &&
            (identical(other.groupId, groupId) || other.groupId == groupId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_administrator),
      const DeepCollectionEquality().hash(_editors),
      groupId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedManagerImplCopyWith<_$SelectedManagerImpl> get copyWith =>
      __$$SelectedManagerImplCopyWithImpl<_$SelectedManagerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<String> administrator, List<String> editors, String groupId)
        selectedManager,
  }) {
    return selectedManager(administrator, editors, groupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            List<String> administrator, List<String> editors, String groupId)?
        selectedManager,
  }) {
    return selectedManager?.call(administrator, editors, groupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            List<String> administrator, List<String> editors, String groupId)?
        selectedManager,
    required TResult orElse(),
  }) {
    if (selectedManager != null) {
      return selectedManager(administrator, editors, groupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectedManager value) selectedManager,
  }) {
    return selectedManager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectedManager value)? selectedManager,
  }) {
    return selectedManager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectedManager value)? selectedManager,
    required TResult orElse(),
  }) {
    if (selectedManager != null) {
      return selectedManager(this);
    }
    return orElse();
  }
}

abstract class _SelectedManager implements ChatGroupCheckManagerState {
  const factory _SelectedManager(
      {final List<String> administrator,
      final List<String> editors,
      final String groupId}) = _$SelectedManagerImpl;

  @override
  List<String> get administrator;
  @override
  List<String> get editors;
  @override
  String get groupId;
  @override
  @JsonKey(ignore: true)
  _$$SelectedManagerImplCopyWith<_$SelectedManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
