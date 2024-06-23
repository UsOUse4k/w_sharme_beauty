part of 'search_result_cubit.dart';

class SearchResult {
  final String name;
  final String formattedAddress;
  final (double, double) coordinates;

  SearchResult({
    required this.name,
    required this.formattedAddress,
    required this.coordinates,
  });
}

@freezed
class SearchResultState with _$SearchResultState {
  const factory SearchResultState({
    required SearchResult? searchResult,
  }) = _SearchResultState;

  factory SearchResultState.initial() => const SearchResultState(
        searchResult: null,
      );
}
