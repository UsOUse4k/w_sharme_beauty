import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/category/domain/entities/category.dart';
import 'package:w_sharme_beauty/features/category/domain/repositories/i_category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._categoryRepository) : super(const _Initial()) {
    on<CategoryEvent>((event, emit) async {
      await event.maybeWhen(
        loadCategories: () async {
          emit(const CategoryState.loading());
          try {
            final result = await _categoryRepository.getAllCategories();
            result.fold((l) => emit(CategoryState.error(message: l.messasge)),
                (categories) {
              emit(CategoryState.success(categories: categories));
            });
          } catch (e) {
            emit(CategoryState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final ICategoryRepository _categoryRepository;
}
