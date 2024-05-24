// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_question_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddQuestionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Question question, bool isAnonymous)
        addedQuestion,
    required TResult Function() getQuestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Question question, bool isAnonymous)? addedQuestion,
    TResult? Function()? getQuestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Question question, bool isAnonymous)? addedQuestion,
    TResult Function()? getQuestions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddedQuestionEvent value) addedQuestion,
    required TResult Function(_GetQuestions value) getQuestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddedQuestionEvent value)? addedQuestion,
    TResult? Function(_GetQuestions value)? getQuestions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddedQuestionEvent value)? addedQuestion,
    TResult Function(_GetQuestions value)? getQuestions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddQuestionEventCopyWith<$Res> {
  factory $AddQuestionEventCopyWith(
          AddQuestionEvent value, $Res Function(AddQuestionEvent) then) =
      _$AddQuestionEventCopyWithImpl<$Res, AddQuestionEvent>;
}

/// @nodoc
class _$AddQuestionEventCopyWithImpl<$Res, $Val extends AddQuestionEvent>
    implements $AddQuestionEventCopyWith<$Res> {
  _$AddQuestionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddedQuestionEventImplCopyWith<$Res> {
  factory _$$AddedQuestionEventImplCopyWith(_$AddedQuestionEventImpl value,
          $Res Function(_$AddedQuestionEventImpl) then) =
      __$$AddedQuestionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Question question, bool isAnonymous});

  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$$AddedQuestionEventImplCopyWithImpl<$Res>
    extends _$AddQuestionEventCopyWithImpl<$Res, _$AddedQuestionEventImpl>
    implements _$$AddedQuestionEventImplCopyWith<$Res> {
  __$$AddedQuestionEventImplCopyWithImpl(_$AddedQuestionEventImpl _value,
      $Res Function(_$AddedQuestionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? isAnonymous = null,
  }) {
    return _then(_$AddedQuestionEventImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }
}

/// @nodoc

class _$AddedQuestionEventImpl implements _AddedQuestionEvent {
  const _$AddedQuestionEventImpl(
      {required this.question, required this.isAnonymous});

  @override
  final Question question;
  @override
  final bool isAnonymous;

  @override
  String toString() {
    return 'AddQuestionEvent.addedQuestion(question: $question, isAnonymous: $isAnonymous)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddedQuestionEventImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question, isAnonymous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddedQuestionEventImplCopyWith<_$AddedQuestionEventImpl> get copyWith =>
      __$$AddedQuestionEventImplCopyWithImpl<_$AddedQuestionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Question question, bool isAnonymous)
        addedQuestion,
    required TResult Function() getQuestions,
  }) {
    return addedQuestion(question, isAnonymous);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Question question, bool isAnonymous)? addedQuestion,
    TResult? Function()? getQuestions,
  }) {
    return addedQuestion?.call(question, isAnonymous);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Question question, bool isAnonymous)? addedQuestion,
    TResult Function()? getQuestions,
    required TResult orElse(),
  }) {
    if (addedQuestion != null) {
      return addedQuestion(question, isAnonymous);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddedQuestionEvent value) addedQuestion,
    required TResult Function(_GetQuestions value) getQuestions,
  }) {
    return addedQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddedQuestionEvent value)? addedQuestion,
    TResult? Function(_GetQuestions value)? getQuestions,
  }) {
    return addedQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddedQuestionEvent value)? addedQuestion,
    TResult Function(_GetQuestions value)? getQuestions,
    required TResult orElse(),
  }) {
    if (addedQuestion != null) {
      return addedQuestion(this);
    }
    return orElse();
  }
}

abstract class _AddedQuestionEvent implements AddQuestionEvent {
  const factory _AddedQuestionEvent(
      {required final Question question,
      required final bool isAnonymous}) = _$AddedQuestionEventImpl;

  Question get question;
  bool get isAnonymous;
  @JsonKey(ignore: true)
  _$$AddedQuestionEventImplCopyWith<_$AddedQuestionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetQuestionsImplCopyWith<$Res> {
  factory _$$GetQuestionsImplCopyWith(
          _$GetQuestionsImpl value, $Res Function(_$GetQuestionsImpl) then) =
      __$$GetQuestionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetQuestionsImplCopyWithImpl<$Res>
    extends _$AddQuestionEventCopyWithImpl<$Res, _$GetQuestionsImpl>
    implements _$$GetQuestionsImplCopyWith<$Res> {
  __$$GetQuestionsImplCopyWithImpl(
      _$GetQuestionsImpl _value, $Res Function(_$GetQuestionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetQuestionsImpl implements _GetQuestions {
  const _$GetQuestionsImpl();

  @override
  String toString() {
    return 'AddQuestionEvent.getQuestions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetQuestionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Question question, bool isAnonymous)
        addedQuestion,
    required TResult Function() getQuestions,
  }) {
    return getQuestions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Question question, bool isAnonymous)? addedQuestion,
    TResult? Function()? getQuestions,
  }) {
    return getQuestions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Question question, bool isAnonymous)? addedQuestion,
    TResult Function()? getQuestions,
    required TResult orElse(),
  }) {
    if (getQuestions != null) {
      return getQuestions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddedQuestionEvent value) addedQuestion,
    required TResult Function(_GetQuestions value) getQuestions,
  }) {
    return getQuestions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddedQuestionEvent value)? addedQuestion,
    TResult? Function(_GetQuestions value)? getQuestions,
  }) {
    return getQuestions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddedQuestionEvent value)? addedQuestion,
    TResult Function(_GetQuestions value)? getQuestions,
    required TResult orElse(),
  }) {
    if (getQuestions != null) {
      return getQuestions(this);
    }
    return orElse();
  }
}

abstract class _GetQuestions implements AddQuestionEvent {
  const factory _GetQuestions() = _$GetQuestionsImpl;
}

/// @nodoc
mixin _$AddQuestionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Question question) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Question question)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Question question)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingQuestion value) loading,
    required TResult Function(_SuccessQuestion value) success,
    required TResult Function(_ErrorQuestion value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingQuestion value)? loading,
    TResult? Function(_SuccessQuestion value)? success,
    TResult? Function(_ErrorQuestion value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingQuestion value)? loading,
    TResult Function(_SuccessQuestion value)? success,
    TResult Function(_ErrorQuestion value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddQuestionStateCopyWith<$Res> {
  factory $AddQuestionStateCopyWith(
          AddQuestionState value, $Res Function(AddQuestionState) then) =
      _$AddQuestionStateCopyWithImpl<$Res, AddQuestionState>;
}

/// @nodoc
class _$AddQuestionStateCopyWithImpl<$Res, $Val extends AddQuestionState>
    implements $AddQuestionStateCopyWith<$Res> {
  _$AddQuestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AddQuestionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AddQuestionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Question question) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Question question)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Question question)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingQuestion value) loading,
    required TResult Function(_SuccessQuestion value) success,
    required TResult Function(_ErrorQuestion value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingQuestion value)? loading,
    TResult? Function(_SuccessQuestion value)? success,
    TResult? Function(_ErrorQuestion value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingQuestion value)? loading,
    TResult Function(_SuccessQuestion value)? success,
    TResult Function(_ErrorQuestion value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddQuestionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingQuestionImplCopyWith<$Res> {
  factory _$$LoadingQuestionImplCopyWith(_$LoadingQuestionImpl value,
          $Res Function(_$LoadingQuestionImpl) then) =
      __$$LoadingQuestionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingQuestionImplCopyWithImpl<$Res>
    extends _$AddQuestionStateCopyWithImpl<$Res, _$LoadingQuestionImpl>
    implements _$$LoadingQuestionImplCopyWith<$Res> {
  __$$LoadingQuestionImplCopyWithImpl(
      _$LoadingQuestionImpl _value, $Res Function(_$LoadingQuestionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingQuestionImpl implements _LoadingQuestion {
  const _$LoadingQuestionImpl();

  @override
  String toString() {
    return 'AddQuestionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingQuestionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Question question) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Question question)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Question question)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingQuestion value) loading,
    required TResult Function(_SuccessQuestion value) success,
    required TResult Function(_ErrorQuestion value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingQuestion value)? loading,
    TResult? Function(_SuccessQuestion value)? success,
    TResult? Function(_ErrorQuestion value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingQuestion value)? loading,
    TResult Function(_SuccessQuestion value)? success,
    TResult Function(_ErrorQuestion value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingQuestion implements AddQuestionState {
  const factory _LoadingQuestion() = _$LoadingQuestionImpl;
}

/// @nodoc
abstract class _$$SuccessQuestionImplCopyWith<$Res> {
  factory _$$SuccessQuestionImplCopyWith(_$SuccessQuestionImpl value,
          $Res Function(_$SuccessQuestionImpl) then) =
      __$$SuccessQuestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Question question});

  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$$SuccessQuestionImplCopyWithImpl<$Res>
    extends _$AddQuestionStateCopyWithImpl<$Res, _$SuccessQuestionImpl>
    implements _$$SuccessQuestionImplCopyWith<$Res> {
  __$$SuccessQuestionImplCopyWithImpl(
      _$SuccessQuestionImpl _value, $Res Function(_$SuccessQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
  }) {
    return _then(_$SuccessQuestionImpl(
      null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }
}

/// @nodoc

class _$SuccessQuestionImpl implements _SuccessQuestion {
  const _$SuccessQuestionImpl(this.question);

  @override
  final Question question;

  @override
  String toString() {
    return 'AddQuestionState.success(question: $question)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessQuestionImpl &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessQuestionImplCopyWith<_$SuccessQuestionImpl> get copyWith =>
      __$$SuccessQuestionImplCopyWithImpl<_$SuccessQuestionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Question question) success,
    required TResult Function(String message) error,
  }) {
    return success(question);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Question question)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(question);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Question question)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(question);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingQuestion value) loading,
    required TResult Function(_SuccessQuestion value) success,
    required TResult Function(_ErrorQuestion value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingQuestion value)? loading,
    TResult? Function(_SuccessQuestion value)? success,
    TResult? Function(_ErrorQuestion value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingQuestion value)? loading,
    TResult Function(_SuccessQuestion value)? success,
    TResult Function(_ErrorQuestion value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SuccessQuestion implements AddQuestionState {
  const factory _SuccessQuestion(final Question question) =
      _$SuccessQuestionImpl;

  Question get question;
  @JsonKey(ignore: true)
  _$$SuccessQuestionImplCopyWith<_$SuccessQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorQuestionImplCopyWith<$Res> {
  factory _$$ErrorQuestionImplCopyWith(
          _$ErrorQuestionImpl value, $Res Function(_$ErrorQuestionImpl) then) =
      __$$ErrorQuestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorQuestionImplCopyWithImpl<$Res>
    extends _$AddQuestionStateCopyWithImpl<$Res, _$ErrorQuestionImpl>
    implements _$$ErrorQuestionImplCopyWith<$Res> {
  __$$ErrorQuestionImplCopyWithImpl(
      _$ErrorQuestionImpl _value, $Res Function(_$ErrorQuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorQuestionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorQuestionImpl implements _ErrorQuestion {
  const _$ErrorQuestionImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AddQuestionState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorQuestionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorQuestionImplCopyWith<_$ErrorQuestionImpl> get copyWith =>
      __$$ErrorQuestionImplCopyWithImpl<_$ErrorQuestionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Question question) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Question question)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Question question)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadingQuestion value) loading,
    required TResult Function(_SuccessQuestion value) success,
    required TResult Function(_ErrorQuestion value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadingQuestion value)? loading,
    TResult? Function(_SuccessQuestion value)? success,
    TResult? Function(_ErrorQuestion value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadingQuestion value)? loading,
    TResult Function(_SuccessQuestion value)? success,
    TResult Function(_ErrorQuestion value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorQuestion implements AddQuestionState {
  const factory _ErrorQuestion({required final String message}) =
      _$ErrorQuestionImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorQuestionImplCopyWith<_$ErrorQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
