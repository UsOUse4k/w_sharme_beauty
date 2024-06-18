import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'select_categories_state.dart';
part 'select_categories_cubit.freezed.dart';

@injectable
class SelectCategoriesCubit extends Cubit<SelectCategoriesState> {
  SelectCategoriesCubit() : super(SelectCategoriesState.initial());

  void initialize(List<String> categories) {
    emit(state.copyWith(categories: categories));
  }

  void categorySelected(String category) {
    final List<String> categories = List.from(state.categories);

    if (state.categories.contains(category)) {
      categories.remove(category);
    } else {
      categories.add(category);
    }

    emit(state.copyWith(categories: categories));
  }
}
