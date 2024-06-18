// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adverts_filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdvertsFilterState {
  String? get category => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  WorkTime? get workTime => throw _privateConstructorUsedError;
  Distance? get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdvertsFilterStateCopyWith<AdvertsFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertsFilterStateCopyWith<$Res> {
  factory $AdvertsFilterStateCopyWith(
          AdvertsFilterState value, $Res Function(AdvertsFilterState) then) =
      _$AdvertsFilterStateCopyWithImpl<$Res, AdvertsFilterState>;
  @useResult
  $Res call(
      {String? category,
      double? rating,
      WorkTime? workTime,
      Distance? distance});
}

/// @nodoc
class _$AdvertsFilterStateCopyWithImpl<$Res, $Val extends AdvertsFilterState>
    implements $AdvertsFilterStateCopyWith<$Res> {
  _$AdvertsFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? rating = freezed,
    Object? workTime = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      workTime: freezed == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as WorkTime?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdvertsFilterStateImplCopyWith<$Res>
    implements $AdvertsFilterStateCopyWith<$Res> {
  factory _$$AdvertsFilterStateImplCopyWith(_$AdvertsFilterStateImpl value,
          $Res Function(_$AdvertsFilterStateImpl) then) =
      __$$AdvertsFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? category,
      double? rating,
      WorkTime? workTime,
      Distance? distance});
}

/// @nodoc
class __$$AdvertsFilterStateImplCopyWithImpl<$Res>
    extends _$AdvertsFilterStateCopyWithImpl<$Res, _$AdvertsFilterStateImpl>
    implements _$$AdvertsFilterStateImplCopyWith<$Res> {
  __$$AdvertsFilterStateImplCopyWithImpl(_$AdvertsFilterStateImpl _value,
      $Res Function(_$AdvertsFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = freezed,
    Object? rating = freezed,
    Object? workTime = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$AdvertsFilterStateImpl(
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      workTime: freezed == workTime
          ? _value.workTime
          : workTime // ignore: cast_nullable_to_non_nullable
              as WorkTime?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as Distance?,
    ));
  }
}

/// @nodoc

class _$AdvertsFilterStateImpl implements _AdvertsFilterState {
  const _$AdvertsFilterStateImpl(
      {this.category, this.rating, this.workTime, this.distance});

  @override
  final String? category;
  @override
  final double? rating;
  @override
  final WorkTime? workTime;
  @override
  final Distance? distance;

  @override
  String toString() {
    return 'AdvertsFilterState(category: $category, rating: $rating, workTime: $workTime, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdvertsFilterStateImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.workTime, workTime) ||
                other.workTime == workTime) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, category, rating, workTime, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdvertsFilterStateImplCopyWith<_$AdvertsFilterStateImpl> get copyWith =>
      __$$AdvertsFilterStateImplCopyWithImpl<_$AdvertsFilterStateImpl>(
          this, _$identity);
}

abstract class _AdvertsFilterState implements AdvertsFilterState {
  const factory _AdvertsFilterState(
      {final String? category,
      final double? rating,
      final WorkTime? workTime,
      final Distance? distance}) = _$AdvertsFilterStateImpl;

  @override
  String? get category;
  @override
  double? get rating;
  @override
  WorkTime? get workTime;
  @override
  Distance? get distance;
  @override
  @JsonKey(ignore: true)
  _$$AdvertsFilterStateImplCopyWith<_$AdvertsFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
