// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectCategoriesState {
  List<String> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectCategoriesStateCopyWith<SelectCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectCategoriesStateCopyWith<$Res> {
  factory $SelectCategoriesStateCopyWith(SelectCategoriesState value,
          $Res Function(SelectCategoriesState) then) =
      _$SelectCategoriesStateCopyWithImpl<$Res, SelectCategoriesState>;
  @useResult
  $Res call({List<String> categories});
}

/// @nodoc
class _$SelectCategoriesStateCopyWithImpl<$Res,
        $Val extends SelectCategoriesState>
    implements $SelectCategoriesStateCopyWith<$Res> {
  _$SelectCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectCategoriesStateImplCopyWith<$Res>
    implements $SelectCategoriesStateCopyWith<$Res> {
  factory _$$SelectCategoriesStateImplCopyWith(
          _$SelectCategoriesStateImpl value,
          $Res Function(_$SelectCategoriesStateImpl) then) =
      __$$SelectCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> categories});
}

/// @nodoc
class __$$SelectCategoriesStateImplCopyWithImpl<$Res>
    extends _$SelectCategoriesStateCopyWithImpl<$Res,
        _$SelectCategoriesStateImpl>
    implements _$$SelectCategoriesStateImplCopyWith<$Res> {
  __$$SelectCategoriesStateImplCopyWithImpl(_$SelectCategoriesStateImpl _value,
      $Res Function(_$SelectCategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$SelectCategoriesStateImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SelectCategoriesStateImpl implements _SelectCategoriesState {
  const _$SelectCategoriesStateImpl({required final List<String> categories})
      : _categories = categories;

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'SelectCategoriesState(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCategoriesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCategoriesStateImplCopyWith<_$SelectCategoriesStateImpl>
      get copyWith => __$$SelectCategoriesStateImplCopyWithImpl<
          _$SelectCategoriesStateImpl>(this, _$identity);
}

abstract class _SelectCategoriesState implements SelectCategoriesState {
  const factory _SelectCategoriesState(
      {required final List<String> categories}) = _$SelectCategoriesStateImpl;

  @override
  List<String> get categories;
  @override
  @JsonKey(ignore: true)
  _$$SelectCategoriesStateImplCopyWith<_$SelectCategoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}