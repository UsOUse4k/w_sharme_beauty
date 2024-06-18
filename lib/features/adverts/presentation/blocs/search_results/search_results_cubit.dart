import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_results_state.dart';
part 'search_results_cubit.freezed.dart';

@injectable
class SearchResultsCubit extends Cubit<SearchResultsState> {
  SearchResultsCubit() : super(SearchResultsState.initial());

  void setSearchResults(List<SearchResult> searchResults) {
    emit(state.copyWith(searchResults: searchResults));
  }

  void addSearchResult(SearchResult searchResult) {
    final List<SearchResult> searchResults = List.from(state.searchResults);

    searchResults.insert(0, searchResult);

    emit(state.copyWith(searchResults: searchResults));
  }
}
