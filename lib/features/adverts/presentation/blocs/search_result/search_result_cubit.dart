import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_result_state.dart';
part 'search_result_cubit.freezed.dart';

@injectable
class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit() : super(SearchResultState.initial());

  void initialize(SearchResult? searchResult) {
    emit(state.copyWith(searchResult: searchResult));
  }

  void searchResultChanged(SearchResult searchResult) {
    emit(state.copyWith(searchResult: searchResult));
  }
}
