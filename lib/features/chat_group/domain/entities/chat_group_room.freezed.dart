// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_group_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatGroupRoom _$ChatGroupRoomFromJson(Map<String, dynamic> json) {
  return _ChatGroupRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatGroupRoom {
  String? get groupName => throw _privateConstructorUsedError;
  String? get groupProfileImage => throw _privateConstructorUsedError;
  List<String>? get joinedUserIds => throw _privateConstructorUsedError;
  List<String>? get inviteOnlyByUserIds => throw _privateConstructorUsedError;
  int? get limitUsers => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get lastSenderId => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  Map<String, String>? get userRoles => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get lastMessageTs => throw _privateConstructorUsedError;
  int? get countMessage => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get seen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGroupRoomCopyWith<ChatGroupRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGroupRoomCopyWith<$Res> {
  factory $ChatGroupRoomCopyWith(
          ChatGroupRoom value, $Res Function(ChatGroupRoom) then) =
      _$ChatGroupRoomCopyWithImpl<$Res, ChatGroupRoom>;
  @useResult
  $Res call(
      {String? groupName,
      String? groupProfileImage,
      List<String>? joinedUserIds,
      List<String>? inviteOnlyByUserIds,
      int? limitUsers,
      String? userId,
      String? lastSenderId,
      @TimestampConverter() Timestamp? createdAt,
      Map<String, String>? userRoles,
      String? groupId,
      String? lastMessage,
      @TimestampConverter() Timestamp? lastMessageTs,
      int? countMessage,
      bool? isActive,
      bool? seen});
}

/// @nodoc
class _$ChatGroupRoomCopyWithImpl<$Res, $Val extends ChatGroupRoom>
    implements $ChatGroupRoomCopyWith<$Res> {
  _$ChatGroupRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = freezed,
    Object? groupProfileImage = freezed,
    Object? joinedUserIds = freezed,
    Object? inviteOnlyByUserIds = freezed,
    Object? limitUsers = freezed,
    Object? userId = freezed,
    Object? lastSenderId = freezed,
    Object? createdAt = freezed,
    Object? userRoles = freezed,
    Object? groupId = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageTs = freezed,
    Object? countMessage = freezed,
    Object? isActive = freezed,
    Object? seen = freezed,
  }) {
    return _then(_value.copyWith(
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupProfileImage: freezed == groupProfileImage
          ? _value.groupProfileImage
          : groupProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedUserIds: freezed == joinedUserIds
          ? _value.joinedUserIds
          : joinedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inviteOnlyByUserIds: freezed == inviteOnlyByUserIds
          ? _value.inviteOnlyByUserIds
          : inviteOnlyByUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      limitUsers: freezed == limitUsers
          ? _value.limitUsers
          : limitUsers // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSenderId: freezed == lastSenderId
          ? _value.lastSenderId
          : lastSenderId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      userRoles: freezed == userRoles
          ? _value.userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageTs: freezed == lastMessageTs
          ? _value.lastMessageTs
          : lastMessageTs // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      countMessage: freezed == countMessage
          ? _value.countMessage
          : countMessage // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      seen: freezed == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatGroupRoomImplCopyWith<$Res>
    implements $ChatGroupRoomCopyWith<$Res> {
  factory _$$ChatGroupRoomImplCopyWith(
          _$ChatGroupRoomImpl value, $Res Function(_$ChatGroupRoomImpl) then) =
      __$$ChatGroupRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? groupName,
      String? groupProfileImage,
      List<String>? joinedUserIds,
      List<String>? inviteOnlyByUserIds,
      int? limitUsers,
      String? userId,
      String? lastSenderId,
      @TimestampConverter() Timestamp? createdAt,
      Map<String, String>? userRoles,
      String? groupId,
      String? lastMessage,
      @TimestampConverter() Timestamp? lastMessageTs,
      int? countMessage,
      bool? isActive,
      bool? seen});
}

/// @nodoc
class __$$ChatGroupRoomImplCopyWithImpl<$Res>
    extends _$ChatGroupRoomCopyWithImpl<$Res, _$ChatGroupRoomImpl>
    implements _$$ChatGroupRoomImplCopyWith<$Res> {
  __$$ChatGroupRoomImplCopyWithImpl(
      _$ChatGroupRoomImpl _value, $Res Function(_$ChatGroupRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = freezed,
    Object? groupProfileImage = freezed,
    Object? joinedUserIds = freezed,
    Object? inviteOnlyByUserIds = freezed,
    Object? limitUsers = freezed,
    Object? userId = freezed,
    Object? lastSenderId = freezed,
    Object? createdAt = freezed,
    Object? userRoles = freezed,
    Object? groupId = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageTs = freezed,
    Object? countMessage = freezed,
    Object? isActive = freezed,
    Object? seen = freezed,
  }) {
    return _then(_$ChatGroupRoomImpl(
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      groupProfileImage: freezed == groupProfileImage
          ? _value.groupProfileImage
          : groupProfileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      joinedUserIds: freezed == joinedUserIds
          ? _value._joinedUserIds
          : joinedUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      inviteOnlyByUserIds: freezed == inviteOnlyByUserIds
          ? _value._inviteOnlyByUserIds
          : inviteOnlyByUserIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      limitUsers: freezed == limitUsers
          ? _value.limitUsers
          : limitUsers // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSenderId: freezed == lastSenderId
          ? _value.lastSenderId
          : lastSenderId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      userRoles: freezed == userRoles
          ? _value._userRoles
          : userRoles // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageTs: freezed == lastMessageTs
          ? _value.lastMessageTs
          : lastMessageTs // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      countMessage: freezed == countMessage
          ? _value.countMessage
          : countMessage // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      seen: freezed == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatGroupRoomImpl implements _ChatGroupRoom {
  const _$ChatGroupRoomImpl(
      {this.groupName,
      this.groupProfileImage,
      final List<String>? joinedUserIds,
      final List<String>? inviteOnlyByUserIds,
      this.limitUsers,
      this.userId,
      this.lastSenderId,
      @TimestampConverter() this.createdAt,
      final Map<String, String>? userRoles,
      this.groupId,
      this.lastMessage,
      @TimestampConverter() this.lastMessageTs,
      this.countMessage,
      this.isActive,
      this.seen})
      : _joinedUserIds = joinedUserIds,
        _inviteOnlyByUserIds = inviteOnlyByUserIds,
        _userRoles = userRoles;

  factory _$ChatGroupRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatGroupRoomImplFromJson(json);

  @override
  final String? groupName;
  @override
  final String? groupProfileImage;
  final List<String>? _joinedUserIds;
  @override
  List<String>? get joinedUserIds {
    final value = _joinedUserIds;
    if (value == null) return null;
    if (_joinedUserIds is EqualUnmodifiableListView) return _joinedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _inviteOnlyByUserIds;
  @override
  List<String>? get inviteOnlyByUserIds {
    final value = _inviteOnlyByUserIds;
    if (value == null) return null;
    if (_inviteOnlyByUserIds is EqualUnmodifiableListView)
      return _inviteOnlyByUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? limitUsers;
  @override
  final String? userId;
  @override
  final String? lastSenderId;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  final Map<String, String>? _userRoles;
  @override
  Map<String, String>? get userRoles {
    final value = _userRoles;
    if (value == null) return null;
    if (_userRoles is EqualUnmodifiableMapView) return _userRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? groupId;
  @override
  final String? lastMessage;
  @override
  @TimestampConverter()
  final Timestamp? lastMessageTs;
  @override
  final int? countMessage;
  @override
  final bool? isActive;
  @override
  final bool? seen;

  @override
  String toString() {
    return 'ChatGroupRoom(groupName: $groupName, groupProfileImage: $groupProfileImage, joinedUserIds: $joinedUserIds, inviteOnlyByUserIds: $inviteOnlyByUserIds, limitUsers: $limitUsers, userId: $userId, lastSenderId: $lastSenderId, createdAt: $createdAt, userRoles: $userRoles, groupId: $groupId, lastMessage: $lastMessage, lastMessageTs: $lastMessageTs, countMessage: $countMessage, isActive: $isActive, seen: $seen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatGroupRoomImpl &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.groupProfileImage, groupProfileImage) ||
                other.groupProfileImage == groupProfileImage) &&
            const DeepCollectionEquality()
                .equals(other._joinedUserIds, _joinedUserIds) &&
            const DeepCollectionEquality()
                .equals(other._inviteOnlyByUserIds, _inviteOnlyByUserIds) &&
            (identical(other.limitUsers, limitUsers) ||
                other.limitUsers == limitUsers) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastSenderId, lastSenderId) ||
                other.lastSenderId == lastSenderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._userRoles, _userRoles) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageTs, lastMessageTs) ||
                other.lastMessageTs == lastMessageTs) &&
            (identical(other.countMessage, countMessage) ||
                other.countMessage == countMessage) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.seen, seen) || other.seen == seen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      groupName,
      groupProfileImage,
      const DeepCollectionEquality().hash(_joinedUserIds),
      const DeepCollectionEquality().hash(_inviteOnlyByUserIds),
      limitUsers,
      userId,
      lastSenderId,
      createdAt,
      const DeepCollectionEquality().hash(_userRoles),
      groupId,
      lastMessage,
      lastMessageTs,
      countMessage,
      isActive,
      seen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatGroupRoomImplCopyWith<_$ChatGroupRoomImpl> get copyWith =>
      __$$ChatGroupRoomImplCopyWithImpl<_$ChatGroupRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatGroupRoomImplToJson(
      this,
    );
  }
}

abstract class _ChatGroupRoom implements ChatGroupRoom {
  const factory _ChatGroupRoom(
      {final String? groupName,
      final String? groupProfileImage,
      final List<String>? joinedUserIds,
      final List<String>? inviteOnlyByUserIds,
      final int? limitUsers,
      final String? userId,
      final String? lastSenderId,
      @TimestampConverter() final Timestamp? createdAt,
      final Map<String, String>? userRoles,
      final String? groupId,
      final String? lastMessage,
      @TimestampConverter() final Timestamp? lastMessageTs,
      final int? countMessage,
      final bool? isActive,
      final bool? seen}) = _$ChatGroupRoomImpl;

  factory _ChatGroupRoom.fromJson(Map<String, dynamic> json) =
      _$ChatGroupRoomImpl.fromJson;

  @override
  String? get groupName;
  @override
  String? get groupProfileImage;
  @override
  List<String>? get joinedUserIds;
  @override
  List<String>? get inviteOnlyByUserIds;
  @override
  int? get limitUsers;
  @override
  String? get userId;
  @override
  String? get lastSenderId;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  Map<String, String>? get userRoles;
  @override
  String? get groupId;
  @override
  String? get lastMessage;
  @override
  @TimestampConverter()
  Timestamp? get lastMessageTs;
  @override
  int? get countMessage;
  @override
  bool? get isActive;
  @override
  bool? get seen;
  @override
  @JsonKey(ignore: true)
  _$$ChatGroupRoomImplCopyWith<_$ChatGroupRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
