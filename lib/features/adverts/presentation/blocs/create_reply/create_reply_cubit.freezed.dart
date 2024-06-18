// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_reply_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateReplyState {
  String get comment => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AdvertFailure, Reply>> get advertFailureOrReplyOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateReplyStateCopyWith<CreateReplyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReplyStateCopyWith<$Res> {
  factory $CreateReplyStateCopyWith(
          CreateReplyState value, $Res Function(CreateReplyState) then) =
      _$CreateReplyStateCopyWithImpl<$Res, CreateReplyState>;
  @useResult
  $Res call(
      {String comment,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AdvertFailure, Reply>> advertFailureOrReplyOption});
}

/// @nodoc
class _$CreateReplyStateCopyWithImpl<$Res, $Val extends CreateReplyState>
    implements $CreateReplyStateCopyWith<$Res> {
  _$CreateReplyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? advertFailureOrReplyOption = null,
  }) {
    return _then(_value.copyWith(
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
      advertFailureOrReplyOption: null == advertFailureOrReplyOption
          ? _value.advertFailureOrReplyOption
          : advertFailureOrReplyOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AdvertFailure, Reply>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReplyStateImplCopyWith<$Res>
    implements $CreateReplyStateCopyWith<$Res> {
  factory _$$CreateReplyStateImplCopyWith(_$CreateReplyStateImpl value,
          $Res Function(_$CreateReplyStateImpl) then) =
      __$$CreateReplyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String comment,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AdvertFailure, Reply>> advertFailureOrReplyOption});
}

/// @nodoc
class __$$CreateReplyStateImplCopyWithImpl<$Res>
    extends _$CreateReplyStateCopyWithImpl<$Res, _$CreateReplyStateImpl>
    implements _$$CreateReplyStateImplCopyWith<$Res> {
  __$$CreateReplyStateImplCopyWithImpl(_$CreateReplyStateImpl _value,
      $Res Function(_$CreateReplyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? advertFailureOrReplyOption = null,
  }) {
    return _then(_$CreateReplyStateImpl(
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
      advertFailureOrReplyOption: null == advertFailureOrReplyOption
          ? _value.advertFailureOrReplyOption
          : advertFailureOrReplyOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AdvertFailure, Reply>>,
    ));
  }
}

/// @nodoc

class _$CreateReplyStateImpl implements _CreateReplyState {
  const _$CreateReplyStateImpl(
      {required this.comment,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.advertFailureOrReplyOption});

  @override
  final String comment;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AdvertFailure, Reply>> advertFailureOrReplyOption;

  @override
  String toString() {
    return 'CreateReplyState(comment: $comment, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, advertFailureOrReplyOption: $advertFailureOrReplyOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReplyStateImpl &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.advertFailureOrReplyOption,
                    advertFailureOrReplyOption) ||
                other.advertFailureOrReplyOption ==
                    advertFailureOrReplyOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment, showErrorMessages,
      isSubmitting, advertFailureOrReplyOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReplyStateImplCopyWith<_$CreateReplyStateImpl> get copyWith =>
      __$$CreateReplyStateImplCopyWithImpl<_$CreateReplyStateImpl>(
          this, _$identity);
}

abstract class _CreateReplyState implements CreateReplyState {
  const factory _CreateReplyState(
      {required final String comment,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AdvertFailure, Reply>>
          advertFailureOrReplyOption}) = _$CreateReplyStateImpl;

  @override
  String get comment;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AdvertFailure, Reply>> get advertFailureOrReplyOption;
  @override
  @JsonKey(ignore: true)
  _$$CreateReplyStateImplCopyWith<_$CreateReplyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
