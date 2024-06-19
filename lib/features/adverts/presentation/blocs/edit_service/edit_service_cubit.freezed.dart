// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_service_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditServiceState {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Service> get serviceOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditServiceStateCopyWith<EditServiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditServiceStateCopyWith<$Res> {
  factory $EditServiceStateCopyWith(
          EditServiceState value, $Res Function(EditServiceState) then) =
      _$EditServiceStateCopyWithImpl<$Res, EditServiceState>;
  @useResult
  $Res call(
      {String name,
      String description,
      int? price,
      bool showErrorMessages,
      Option<Service> serviceOption});
}

/// @nodoc
class _$EditServiceStateCopyWithImpl<$Res, $Val extends EditServiceState>
    implements $EditServiceStateCopyWith<$Res> {
  _$EditServiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = freezed,
    Object? showErrorMessages = null,
    Object? serviceOption = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceOption: null == serviceOption
          ? _value.serviceOption
          : serviceOption // ignore: cast_nullable_to_non_nullable
              as Option<Service>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditServiceStateImplCopyWith<$Res>
    implements $EditServiceStateCopyWith<$Res> {
  factory _$$EditServiceStateImplCopyWith(_$EditServiceStateImpl value,
          $Res Function(_$EditServiceStateImpl) then) =
      __$$EditServiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      int? price,
      bool showErrorMessages,
      Option<Service> serviceOption});
}

/// @nodoc
class __$$EditServiceStateImplCopyWithImpl<$Res>
    extends _$EditServiceStateCopyWithImpl<$Res, _$EditServiceStateImpl>
    implements _$$EditServiceStateImplCopyWith<$Res> {
  __$$EditServiceStateImplCopyWithImpl(_$EditServiceStateImpl _value,
      $Res Function(_$EditServiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = freezed,
    Object? showErrorMessages = null,
    Object? serviceOption = null,
  }) {
    return _then(_$EditServiceStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceOption: null == serviceOption
          ? _value.serviceOption
          : serviceOption // ignore: cast_nullable_to_non_nullable
              as Option<Service>,
    ));
  }
}

/// @nodoc

class _$EditServiceStateImpl implements _EditServiceState {
  const _$EditServiceStateImpl(
      {required this.name,
      required this.description,
      required this.price,
      required this.showErrorMessages,
      required this.serviceOption});

  @override
  final String name;
  @override
  final String description;
  @override
  final int? price;
  @override
  final bool showErrorMessages;
  @override
  final Option<Service> serviceOption;

  @override
  String toString() {
    return 'EditServiceState(name: $name, description: $description, price: $price, showErrorMessages: $showErrorMessages, serviceOption: $serviceOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditServiceStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.serviceOption, serviceOption) ||
                other.serviceOption == serviceOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, description, price, showErrorMessages, serviceOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditServiceStateImplCopyWith<_$EditServiceStateImpl> get copyWith =>
      __$$EditServiceStateImplCopyWithImpl<_$EditServiceStateImpl>(
          this, _$identity);
}

abstract class _EditServiceState implements EditServiceState {
  const factory _EditServiceState(
      {required final String name,
      required final String description,
      required final int? price,
      required final bool showErrorMessages,
      required final Option<Service> serviceOption}) = _$EditServiceStateImpl;

  @override
  String get name;
  @override
  String get description;
  @override
  int? get price;
  @override
  bool get showErrorMessages;
  @override
  Option<Service> get serviceOption;
  @override
  @JsonKey(ignore: true)
  _$$EditServiceStateImplCopyWith<_$EditServiceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}