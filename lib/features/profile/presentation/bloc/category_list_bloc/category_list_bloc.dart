import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';
part 'category_list_bloc.freezed.dart';

@injectable
class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  CategoryListBloc() : super(const _Selected()) {
    on<CategoryListEvent>((event, emit) {
      event.maybeWhen(
        loaded: (title) {
          emit(CategoryListState.selected(selectedTitle: title));
        },
        toggleUserSelection: (title) {
          final List<String> updatedTitle =
              List<String>.from(state.selectedTitle);
          if (updatedTitle.contains(title)) {
            updatedTitle.remove(title);
          } else {
            updatedTitle.add(title);
          }
          emit(state.copyWith(selectedTitle: updatedTitle));
        },
        orElse: () {},
      );
    });
  }
}
