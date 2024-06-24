// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_schedule_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectScheduleState {
  bool get isAroundClock => throw _privateConstructorUsedError;
  List<Time> get schedule => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectScheduleStateCopyWith<SelectScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectScheduleStateCopyWith<$Res> {
  factory $SelectScheduleStateCopyWith(
          SelectScheduleState value, $Res Function(SelectScheduleState) then) =
      _$SelectScheduleStateCopyWithImpl<$Res, SelectScheduleState>;
  @useResult
  $Res call({bool isAroundClock, List<Time> schedule});
}

/// @nodoc
class _$SelectScheduleStateCopyWithImpl<$Res, $Val extends SelectScheduleState>
    implements $SelectScheduleStateCopyWith<$Res> {
  _$SelectScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAroundClock = null,
    Object? schedule = null,
  }) {
    return _then(_value.copyWith(
      isAroundClock: null == isAroundClock
          ? _value.isAroundClock
          : isAroundClock // ignore: cast_nullable_to_non_nullable
              as bool,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Time>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectScheduleStateImplCopyWith<$Res>
    implements $SelectScheduleStateCopyWith<$Res> {
  factory _$$SelectScheduleStateImplCopyWith(_$SelectScheduleStateImpl value,
          $Res Function(_$SelectScheduleStateImpl) then) =
      __$$SelectScheduleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAroundClock, List<Time> schedule});
}

/// @nodoc
class __$$SelectScheduleStateImplCopyWithImpl<$Res>
    extends _$SelectScheduleStateCopyWithImpl<$Res, _$SelectScheduleStateImpl>
    implements _$$SelectScheduleStateImplCopyWith<$Res> {
  __$$SelectScheduleStateImplCopyWithImpl(_$SelectScheduleStateImpl _value,
      $Res Function(_$SelectScheduleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAroundClock = null,
    Object? schedule = null,
  }) {
    return _then(_$SelectScheduleStateImpl(
      isAroundClock: null == isAroundClock
          ? _value.isAroundClock
          : isAroundClock // ignore: cast_nullable_to_non_nullable
              as bool,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Time>,
    ));
  }
}

/// @nodoc

class _$SelectScheduleStateImpl implements _SelectScheduleState {
  const _$SelectScheduleStateImpl(
      {required this.isAroundClock, required final List<Time> schedule})
      : _schedule = schedule;

  @override
  final bool isAroundClock;
  final List<Time> _schedule;
  @override
  List<Time> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  String toString() {
    return 'SelectScheduleState(isAroundClock: $isAroundClock, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectScheduleStateImpl &&
            (identical(other.isAroundClock, isAroundClock) ||
                other.isAroundClock == isAroundClock) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAroundClock,
      const DeepCollectionEquality().hash(_schedule));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectScheduleStateImplCopyWith<_$SelectScheduleStateImpl> get copyWith =>
      __$$SelectScheduleStateImplCopyWithImpl<_$SelectScheduleStateImpl>(
          this, _$identity);
}

abstract class _SelectScheduleState implements SelectScheduleState {
  const factory _SelectScheduleState(
      {required final bool isAroundClock,
      required final List<Time> schedule}) = _$SelectScheduleStateImpl;

  @override
  bool get isAroundClock;
  @override
  List<Time> get schedule;
  @override
  @JsonKey(ignore: true)
  _$$SelectScheduleStateImplCopyWith<_$SelectScheduleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
