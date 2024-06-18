part of 'search_results_cubit.dart';

class SearchResult {
  final String title;
  final String? subtitle;
  final (double, double)? coordinates;

  SearchResult({required this.title, this.subtitle, this.coordinates});
}

@freezed
class SearchResultsState with _$SearchResultsState {
  const factory SearchResultsState({
    required List<SearchResult> searchResults,
  }) = _SearchResultsState;

  factory SearchResultsState.initial() => const SearchResultsState(
        searchResults: [],
      );
}
