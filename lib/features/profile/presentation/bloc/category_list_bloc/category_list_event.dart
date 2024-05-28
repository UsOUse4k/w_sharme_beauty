part of 'category_list_bloc.dart';

@freezed
class CategoryListEvent with _$CategoryListEvent {
  const factory CategoryListEvent.toggleUserSelection(String title) =
      _ToggleUserSelection;
  const factory CategoryListEvent.loaded(List<String> title) = _Loaded;
}
