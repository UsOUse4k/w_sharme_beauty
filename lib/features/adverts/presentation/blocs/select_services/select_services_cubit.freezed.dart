// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_services_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectServicesState {
  List<Service> get services => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectServicesStateCopyWith<SelectServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectServicesStateCopyWith<$Res> {
  factory $SelectServicesStateCopyWith(
          SelectServicesState value, $Res Function(SelectServicesState) then) =
      _$SelectServicesStateCopyWithImpl<$Res, SelectServicesState>;
  @useResult
  $Res call({List<Service> services});
}

/// @nodoc
class _$SelectServicesStateCopyWithImpl<$Res, $Val extends SelectServicesState>
    implements $SelectServicesStateCopyWith<$Res> {
  _$SelectServicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectServicesStateImplCopyWith<$Res>
    implements $SelectServicesStateCopyWith<$Res> {
  factory _$$SelectServicesStateImplCopyWith(_$SelectServicesStateImpl value,
          $Res Function(_$SelectServicesStateImpl) then) =
      __$$SelectServicesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Service> services});
}

/// @nodoc
class __$$SelectServicesStateImplCopyWithImpl<$Res>
    extends _$SelectServicesStateCopyWithImpl<$Res, _$SelectServicesStateImpl>
    implements _$$SelectServicesStateImplCopyWith<$Res> {
  __$$SelectServicesStateImplCopyWithImpl(_$SelectServicesStateImpl _value,
      $Res Function(_$SelectServicesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? services = null,
  }) {
    return _then(_$SelectServicesStateImpl(
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
    ));
  }
}

/// @nodoc

class _$SelectServicesStateImpl implements _SelectServicesState {
  const _$SelectServicesStateImpl({required final List<Service> services})
      : _services = services;

  final List<Service> _services;
  @override
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  String toString() {
    return 'SelectServicesState(services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectServicesStateImpl &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectServicesStateImplCopyWith<_$SelectServicesStateImpl> get copyWith =>
      __$$SelectServicesStateImplCopyWithImpl<_$SelectServicesStateImpl>(
          this, _$identity);
}

abstract class _SelectServicesState implements SelectServicesState {
  const factory _SelectServicesState({required final List<Service> services}) =
      _$SelectServicesStateImpl;

  @override
  List<Service> get services;
  @override
  @JsonKey(ignore: true)
  _$$SelectServicesStateImplCopyWith<_$SelectServicesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
