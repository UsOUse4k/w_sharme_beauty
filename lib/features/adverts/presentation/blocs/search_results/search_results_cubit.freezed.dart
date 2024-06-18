// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_results_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchResultsState {
  List<SearchResult> get searchResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResultsStateCopyWith<SearchResultsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultsStateCopyWith<$Res> {
  factory $SearchResultsStateCopyWith(
          SearchResultsState value, $Res Function(SearchResultsState) then) =
      _$SearchResultsStateCopyWithImpl<$Res, SearchResultsState>;
  @useResult
  $Res call({List<SearchResult> searchResults});
}

/// @nodoc
class _$SearchResultsStateCopyWithImpl<$Res, $Val extends SearchResultsState>
    implements $SearchResultsStateCopyWith<$Res> {
  _$SearchResultsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
  }) {
    return _then(_value.copyWith(
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchResultsStateImplCopyWith<$Res>
    implements $SearchResultsStateCopyWith<$Res> {
  factory _$$SearchResultsStateImplCopyWith(_$SearchResultsStateImpl value,
          $Res Function(_$SearchResultsStateImpl) then) =
      __$$SearchResultsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SearchResult> searchResults});
}

/// @nodoc
class __$$SearchResultsStateImplCopyWithImpl<$Res>
    extends _$SearchResultsStateCopyWithImpl<$Res, _$SearchResultsStateImpl>
    implements _$$SearchResultsStateImplCopyWith<$Res> {
  __$$SearchResultsStateImplCopyWithImpl(_$SearchResultsStateImpl _value,
      $Res Function(_$SearchResultsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
  }) {
    return _then(_$SearchResultsStateImpl(
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<SearchResult>,
    ));
  }
}

/// @nodoc

class _$SearchResultsStateImpl implements _SearchResultsState {
  const _$SearchResultsStateImpl(
      {required final List<SearchResult> searchResults})
      : _searchResults = searchResults;

  final List<SearchResult> _searchResults;
  @override
  List<SearchResult> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  String toString() {
    return 'SearchResultsState(searchResults: $searchResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchResultsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchResultsStateImplCopyWith<_$SearchResultsStateImpl> get copyWith =>
      __$$SearchResultsStateImplCopyWithImpl<_$SearchResultsStateImpl>(
          this, _$identity);
}

abstract class _SearchResultsState implements SearchResultsState {
  const factory _SearchResultsState(
          {required final List<SearchResult> searchResults}) =
      _$SearchResultsStateImpl;

  @override
  List<SearchResult> get searchResults;
  @override
  @JsonKey(ignore: true)
  _$$SearchResultsStateImplCopyWith<_$SearchResultsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
