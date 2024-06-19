// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_advert_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateAdvertState {
  List<File> get images => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  List<Time>? get schedule => throw _privateConstructorUsedError;
  List<Service> get services => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AdvertFailure, Advert>> get advertFailureOrAdvertOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateAdvertStateCopyWith<CreateAdvertState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAdvertStateCopyWith<$Res> {
  factory $CreateAdvertStateCopyWith(
          CreateAdvertState value, $Res Function(CreateAdvertState) then) =
      _$CreateAdvertStateCopyWithImpl<$Res, CreateAdvertState>;
  @useResult
  $Res call(
      {List<File> images,
      List<String> categories,
      String name,
      String description,
      Location? location,
      String phoneNumber,
      List<Time>? schedule,
      List<Service> services,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AdvertFailure, Advert>> advertFailureOrAdvertOption});

  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$CreateAdvertStateCopyWithImpl<$Res, $Val extends CreateAdvertState>
    implements $CreateAdvertStateCopyWith<$Res> {
  _$CreateAdvertStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? categories = null,
    Object? name = null,
    Object? description = null,
    Object? location = freezed,
    Object? phoneNumber = null,
    Object? schedule = freezed,
    Object? services = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? advertFailureOrAdvertOption = null,
  }) {
    return _then(_value.copyWith(
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: freezed == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Time>?,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      advertFailureOrAdvertOption: null == advertFailureOrAdvertOption
          ? _value.advertFailureOrAdvertOption
          : advertFailureOrAdvertOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AdvertFailure, Advert>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateAdvertStateImplCopyWith<$Res>
    implements $CreateAdvertStateCopyWith<$Res> {
  factory _$$CreateAdvertStateImplCopyWith(_$CreateAdvertStateImpl value,
          $Res Function(_$CreateAdvertStateImpl) then) =
      __$$CreateAdvertStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<File> images,
      List<String> categories,
      String name,
      String description,
      Location? location,
      String phoneNumber,
      List<Time>? schedule,
      List<Service> services,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AdvertFailure, Advert>> advertFailureOrAdvertOption});

  @override
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$CreateAdvertStateImplCopyWithImpl<$Res>
    extends _$CreateAdvertStateCopyWithImpl<$Res, _$CreateAdvertStateImpl>
    implements _$$CreateAdvertStateImplCopyWith<$Res> {
  __$$CreateAdvertStateImplCopyWithImpl(_$CreateAdvertStateImpl _value,
      $Res Function(_$CreateAdvertStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? categories = null,
    Object? name = null,
    Object? description = null,
    Object? location = freezed,
    Object? phoneNumber = null,
    Object? schedule = freezed,
    Object? services = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? advertFailureOrAdvertOption = null,
  }) {
    return _then(_$CreateAdvertStateImpl(
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: freezed == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as List<Time>?,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      advertFailureOrAdvertOption: null == advertFailureOrAdvertOption
          ? _value.advertFailureOrAdvertOption
          : advertFailureOrAdvertOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AdvertFailure, Advert>>,
    ));
  }
}

/// @nodoc

class _$CreateAdvertStateImpl implements _CreateAdvertState {
  const _$CreateAdvertStateImpl(
      {required final List<File> images,
      required final List<String> categories,
      required this.name,
      required this.description,
      required this.location,
      required this.phoneNumber,
      required final List<Time>? schedule,
      required final List<Service> services,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.advertFailureOrAdvertOption})
      : _images = images,
        _categories = categories,
        _schedule = schedule,
        _services = services;

  final List<File> _images;
  @override
  List<File> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String name;
  @override
  final String description;
  @override
  final Location? location;
  @override
  final String phoneNumber;
  final List<Time>? _schedule;
  @override
  List<Time>? get schedule {
    final value = _schedule;
    if (value == null) return null;
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Service> _services;
  @override
  List<Service> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AdvertFailure, Advert>> advertFailureOrAdvertOption;

  @override
  String toString() {
    return 'CreateAdvertState(images: $images, categories: $categories, name: $name, description: $description, location: $location, phoneNumber: $phoneNumber, schedule: $schedule, services: $services, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, advertFailureOrAdvertOption: $advertFailureOrAdvertOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAdvertStateImpl &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.advertFailureOrAdvertOption,
                    advertFailureOrAdvertOption) ||
                other.advertFailureOrAdvertOption ==
                    advertFailureOrAdvertOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_categories),
      name,
      description,
      location,
      phoneNumber,
      const DeepCollectionEquality().hash(_schedule),
      const DeepCollectionEquality().hash(_services),
      showErrorMessages,
      isSubmitting,
      advertFailureOrAdvertOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAdvertStateImplCopyWith<_$CreateAdvertStateImpl> get copyWith =>
      __$$CreateAdvertStateImplCopyWithImpl<_$CreateAdvertStateImpl>(
          this, _$identity);
}

abstract class _CreateAdvertState implements CreateAdvertState {
  const factory _CreateAdvertState(
      {required final List<File> images,
      required final List<String> categories,
      required final String name,
      required final String description,
      required final Location? location,
      required final String phoneNumber,
      required final List<Time>? schedule,
      required final List<Service> services,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AdvertFailure, Advert>>
          advertFailureOrAdvertOption}) = _$CreateAdvertStateImpl;

  @override
  List<File> get images;
  @override
  List<String> get categories;
  @override
  String get name;
  @override
  String get description;
  @override
  Location? get location;
  @override
  String get phoneNumber;
  @override
  List<Time>? get schedule;
  @override
  List<Service> get services;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AdvertFailure, Advert>> get advertFailureOrAdvertOption;
  @override
  @JsonKey(ignore: true)
  _$$CreateAdvertStateImplCopyWith<_$CreateAdvertStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}