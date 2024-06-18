// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_review_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateReviewState {
  int? get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AdvertFailure, Review>> get advertFailureOrReviewOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateReviewStateCopyWith<CreateReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReviewStateCopyWith<$Res> {
  factory $CreateReviewStateCopyWith(
          CreateReviewState value, $Res Function(CreateReviewState) then) =
      _$CreateReviewStateCopyWithImpl<$Res, CreateReviewState>;
  @useResult
  $Res call(
      {int? rating,
      String comment,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AdvertFailure, Review>> advertFailureOrReviewOption});
}

/// @nodoc
class _$CreateReviewStateCopyWithImpl<$Res, $Val extends CreateReviewState>
    implements $CreateReviewStateCopyWith<$Res> {
  _$CreateReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? comment = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? advertFailureOrReviewOption = null,
  }) {
    return _then(_value.copyWith(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      advertFailureOrReviewOption: null == advertFailureOrReviewOption
          ? _value.advertFailureOrReviewOption
          : advertFailureOrReviewOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AdvertFailure, Review>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReviewStateImplCopyWith<$Res>
    implements $CreateReviewStateCopyWith<$Res> {
  factory _$$CreateReviewStateImplCopyWith(_$CreateReviewStateImpl value,
          $Res Function(_$CreateReviewStateImpl) then) =
      __$$CreateReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? rating,
      String comment,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AdvertFailure, Review>> advertFailureOrReviewOption});
}

/// @nodoc
class __$$CreateReviewStateImplCopyWithImpl<$Res>
    extends _$CreateReviewStateCopyWithImpl<$Res, _$CreateReviewStateImpl>
    implements _$$CreateReviewStateImplCopyWith<$Res> {
  __$$CreateReviewStateImplCopyWithImpl(_$CreateReviewStateImpl _value,
      $Res Function(_$CreateReviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? comment = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? advertFailureOrReviewOption = null,
  }) {
    return _then(_$CreateReviewStateImpl(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      advertFailureOrReviewOption: null == advertFailureOrReviewOption
          ? _value.advertFailureOrReviewOption
          : advertFailureOrReviewOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AdvertFailure, Review>>,
    ));
  }
}

/// @nodoc

class _$CreateReviewStateImpl implements _CreateReviewState {
  const _$CreateReviewStateImpl(
      {required this.rating,
      required this.comment,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.advertFailureOrReviewOption});

  @override
  final int? rating;
  @override
  final String comment;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AdvertFailure, Review>> advertFailureOrReviewOption;

  @override
  String toString() {
    return 'CreateReviewState(rating: $rating, comment: $comment, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, advertFailureOrReviewOption: $advertFailureOrReviewOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReviewStateImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.advertFailureOrReviewOption,
                    advertFailureOrReviewOption) ||
                other.advertFailureOrReviewOption ==
                    advertFailureOrReviewOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rating, comment,
      showErrorMessages, isSubmitting, advertFailureOrReviewOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReviewStateImplCopyWith<_$CreateReviewStateImpl> get copyWith =>
      __$$CreateReviewStateImplCopyWithImpl<_$CreateReviewStateImpl>(
          this, _$identity);
}

abstract class _CreateReviewState implements CreateReviewState {
  const factory _CreateReviewState(
      {required final int? rating,
      required final String comment,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AdvertFailure, Review>>
          advertFailureOrReviewOption}) = _$CreateReviewStateImpl;

  @override
  int? get rating;
  @override
  String get comment;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AdvertFailure, Review>> get advertFailureOrReviewOption;
  @override
  @JsonKey(ignore: true)
  _$$CreateReviewStateImplCopyWith<_$CreateReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
