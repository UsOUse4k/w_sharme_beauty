part of 'select_categories_cubit.dart';

@freezed
class SelectCategoriesState with _$SelectCategoriesState {
  const factory SelectCategoriesState({
    required List<String> categories,
  }) = _SelectCategoriesState;

  factory SelectCategoriesState.initial() => const SelectCategoriesState(
        categories: [],
      );
}
