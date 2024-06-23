// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_result_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchResultState {
  SearchResult? get searchResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResultStateCopyWith<SearchResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultStateCopyWith<$Res> {
  factory $SearchResultStateCopyWith(
          SearchResultState value, $Res Function(SearchResultState) then) =
      _$SearchResultStateCopyWithImpl<$Res, SearchResultState>;
  @useResult
  $Res call({SearchResult? searchResult});
}

/// @nodoc
class _$SearchResultStateCopyWithImpl<$Res, $Val extends SearchResultState>
    implements $SearchResultStateCopyWith<$Res> {
  _$SearchResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = freezed,
  }) {
    return _then(_value.copyWith(
      searchResult: freezed == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as SearchResult?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResultStateImplCopyWith<$Res>
    implements $SearchResultStateCopyWith<$Res> {
  factory _$$SearchResultStateImplCopyWith(_$SearchResultStateImpl value,
          $Res Function(_$SearchResultStateImpl) then) =
      __$$SearchResultStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchResult? searchResult});
}

/// @nodoc
class __$$SearchResultStateImplCopyWithImpl<$Res>
    extends _$SearchResultStateCopyWithImpl<$Res, _$SearchResultStateImpl>
    implements _$$SearchResultStateImplCopyWith<$Res> {
  __$$SearchResultStateImplCopyWithImpl(_$SearchResultStateImpl _value,
      $Res Function(_$SearchResultStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = freezed,
  }) {
    return _then(_$SearchResultStateImpl(
      searchResult: freezed == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as SearchResult?,
    ));
  }
}

/// @nodoc

class _$SearchResultStateImpl implements _SearchResultState {
  const _$SearchResultStateImpl({required this.searchResult});

  @override
  final SearchResult? searchResult;

  @override
  String toString() {
    return 'SearchResultState(searchResult: $searchResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultStateImpl &&
            (identical(other.searchResult, searchResult) ||
                other.searchResult == searchResult));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultStateImplCopyWith<_$SearchResultStateImpl> get copyWith =>
      __$$SearchResultStateImplCopyWithImpl<_$SearchResultStateImpl>(
          this, _$identity);
}

abstract class _SearchResultState implements SearchResultState {
  const factory _SearchResultState(
      {required final SearchResult? searchResult}) = _$SearchResultStateImpl;

  @override
  SearchResult? get searchResult;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultStateImplCopyWith<_$SearchResultStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
