// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'communities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Communities _$CommunitiesFromJson(Map<String, dynamic> json) {
  return _Communities.fromJson(json);
}

/// @nodoc
mixin _$Communities {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommunitiesCopyWith<Communities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunitiesCopyWith<$Res> {
  factory $CommunitiesCopyWith(
          Communities value, $Res Function(Communities) then) =
      _$CommunitiesCopyWithImpl<$Res, Communities>;
  @useResult
  $Res call({String id, String name, String imageUrl, String description});
}

/// @nodoc
class _$CommunitiesCopyWithImpl<$Res, $Val extends Communities>
    implements $CommunitiesCopyWith<$Res> {
  _$CommunitiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunitiesImplCopyWith<$Res>
    implements $CommunitiesCopyWith<$Res> {
  factory _$$CommunitiesImplCopyWith(
          _$CommunitiesImpl value, $Res Function(_$CommunitiesImpl) then) =
      __$$CommunitiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String imageUrl, String description});
}

/// @nodoc
class __$$CommunitiesImplCopyWithImpl<$Res>
    extends _$CommunitiesCopyWithImpl<$Res, _$CommunitiesImpl>
    implements _$$CommunitiesImplCopyWith<$Res> {
  __$$CommunitiesImplCopyWithImpl(
      _$CommunitiesImpl _value, $Res Function(_$CommunitiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? description = null,
  }) {
    return _then(_$CommunitiesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunitiesImpl implements _Communities {
  _$CommunitiesImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.description});

  factory _$CommunitiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunitiesImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String description;

  @override
  String toString() {
    return 'Communities(id: $id, name: $name, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunitiesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, imageUrl, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunitiesImplCopyWith<_$CommunitiesImpl> get copyWith =>
      __$$CommunitiesImplCopyWithImpl<_$CommunitiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunitiesImplToJson(
      this,
    );
  }
}

abstract class _Communities implements Communities {
  factory _Communities(
      {required final String id,
      required final String name,
      required final String imageUrl,
      required final String description}) = _$CommunitiesImpl;

  factory _Communities.fromJson(Map<String, dynamic> json) =
      _$CommunitiesImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$CommunitiesImplCopyWith<_$CommunitiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
