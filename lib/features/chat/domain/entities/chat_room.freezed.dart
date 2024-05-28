// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) {
  return _ChatRoom.fromJson(json);
}

/// @nodoc
mixin _$ChatRoom {
  String? get chatRoomId => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  String? get lastSenderId => throw _privateConstructorUsedError;
  String? get receiverId => throw _privateConstructorUsedError;
  String? get receiverUsername => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get lastMessageTs => throw _privateConstructorUsedError;
  List<String>? get members => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;
  bool? get seen => throw _privateConstructorUsedError;
  int? get messageCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomCopyWith<ChatRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomCopyWith<$Res> {
  factory $ChatRoomCopyWith(ChatRoom value, $Res Function(ChatRoom) then) =
      _$ChatRoomCopyWithImpl<$Res, ChatRoom>;
  @useResult
  $Res call(
      {String? chatRoomId,
      String? lastMessage,
      String? lastSenderId,
      String? receiverId,
      String? receiverUsername,
      @TimestampConverter() Timestamp? lastMessageTs,
      List<String>? members,
      @TimestampConverter() Timestamp? createdAt,
      bool? seen,
      int? messageCount});
}

/// @nodoc
class _$ChatRoomCopyWithImpl<$Res, $Val extends ChatRoom>
    implements $ChatRoomCopyWith<$Res> {
  _$ChatRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = freezed,
    Object? lastMessage = freezed,
    Object? lastSenderId = freezed,
    Object? receiverId = freezed,
    Object? receiverUsername = freezed,
    Object? lastMessageTs = freezed,
    Object? members = freezed,
    Object? createdAt = freezed,
    Object? seen = freezed,
    Object? messageCount = freezed,
  }) {
    return _then(_value.copyWith(
      chatRoomId: freezed == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSenderId: freezed == lastSenderId
          ? _value.lastSenderId
          : lastSenderId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverUsername: freezed == receiverUsername
          ? _value.receiverUsername
          : receiverUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageTs: freezed == lastMessageTs
          ? _value.lastMessageTs
          : lastMessageTs // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      seen: freezed == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool?,
      messageCount: freezed == messageCount
          ? _value.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomImplCopyWith<$Res>
    implements $ChatRoomCopyWith<$Res> {
  factory _$$ChatRoomImplCopyWith(
          _$ChatRoomImpl value, $Res Function(_$ChatRoomImpl) then) =
      __$$ChatRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? chatRoomId,
      String? lastMessage,
      String? lastSenderId,
      String? receiverId,
      String? receiverUsername,
      @TimestampConverter() Timestamp? lastMessageTs,
      List<String>? members,
      @TimestampConverter() Timestamp? createdAt,
      bool? seen,
      int? messageCount});
}

/// @nodoc
class __$$ChatRoomImplCopyWithImpl<$Res>
    extends _$ChatRoomCopyWithImpl<$Res, _$ChatRoomImpl>
    implements _$$ChatRoomImplCopyWith<$Res> {
  __$$ChatRoomImplCopyWithImpl(
      _$ChatRoomImpl _value, $Res Function(_$ChatRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = freezed,
    Object? lastMessage = freezed,
    Object? lastSenderId = freezed,
    Object? receiverId = freezed,
    Object? receiverUsername = freezed,
    Object? lastMessageTs = freezed,
    Object? members = freezed,
    Object? createdAt = freezed,
    Object? seen = freezed,
    Object? messageCount = freezed,
  }) {
    return _then(_$ChatRoomImpl(
      chatRoomId: freezed == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSenderId: freezed == lastSenderId
          ? _value.lastSenderId
          : lastSenderId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverUsername: freezed == receiverUsername
          ? _value.receiverUsername
          : receiverUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageTs: freezed == lastMessageTs
          ? _value.lastMessageTs
          : lastMessageTs // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      seen: freezed == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool?,
      messageCount: freezed == messageCount
          ? _value.messageCount
          : messageCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomImpl implements _ChatRoom {
  const _$ChatRoomImpl(
      {this.chatRoomId,
      this.lastMessage,
      this.lastSenderId,
      this.receiverId,
      this.receiverUsername,
      @TimestampConverter() this.lastMessageTs,
      final List<String>? members,
      @TimestampConverter() this.createdAt,
      this.seen,
      this.messageCount})
      : _members = members;

  factory _$ChatRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomImplFromJson(json);

  @override
  final String? chatRoomId;
  @override
  final String? lastMessage;
  @override
  final String? lastSenderId;
  @override
  final String? receiverId;
  @override
  final String? receiverUsername;
  @override
  @TimestampConverter()
  final Timestamp? lastMessageTs;
  final List<String>? _members;
  @override
  List<String>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @TimestampConverter()
  final Timestamp? createdAt;
  @override
  final bool? seen;
  @override
  final int? messageCount;

  @override
  String toString() {
    return 'ChatRoom(chatRoomId: $chatRoomId, lastMessage: $lastMessage, lastSenderId: $lastSenderId, receiverId: $receiverId, receiverUsername: $receiverUsername, lastMessageTs: $lastMessageTs, members: $members, createdAt: $createdAt, seen: $seen, messageCount: $messageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomImpl &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastSenderId, lastSenderId) ||
                other.lastSenderId == lastSenderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverUsername, receiverUsername) ||
                other.receiverUsername == receiverUsername) &&
            (identical(other.lastMessageTs, lastMessageTs) ||
                other.lastMessageTs == lastMessageTs) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.seen, seen) || other.seen == seen) &&
            (identical(other.messageCount, messageCount) ||
                other.messageCount == messageCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatRoomId,
      lastMessage,
      lastSenderId,
      receiverId,
      receiverUsername,
      lastMessageTs,
      const DeepCollectionEquality().hash(_members),
      createdAt,
      seen,
      messageCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      __$$ChatRoomImplCopyWithImpl<_$ChatRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomImplToJson(
      this,
    );
  }
}

abstract class _ChatRoom implements ChatRoom {
  const factory _ChatRoom(
      {final String? chatRoomId,
      final String? lastMessage,
      final String? lastSenderId,
      final String? receiverId,
      final String? receiverUsername,
      @TimestampConverter() final Timestamp? lastMessageTs,
      final List<String>? members,
      @TimestampConverter() final Timestamp? createdAt,
      final bool? seen,
      final int? messageCount}) = _$ChatRoomImpl;

  factory _ChatRoom.fromJson(Map<String, dynamic> json) =
      _$ChatRoomImpl.fromJson;

  @override
  String? get chatRoomId;
  @override
  String? get lastMessage;
  @override
  String? get lastSenderId;
  @override
  String? get receiverId;
  @override
  String? get receiverUsername;
  @override
  @TimestampConverter()
  Timestamp? get lastMessageTs;
  @override
  List<String>? get members;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;
  @override
  bool? get seen;
  @override
  int? get messageCount;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomImplCopyWith<_$ChatRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
