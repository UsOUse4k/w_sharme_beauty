part of 'category_list_bloc.dart';

@freezed
class CategoryListState with _$CategoryListState {
   const factory CategoryListState.selected({
    @Default([]) List<String> selectedTitle,
  }) = _Selected;
}
