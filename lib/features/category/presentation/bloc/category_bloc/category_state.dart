part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.success({required List<Category> categories}) = _Success;
  const factory CategoryState.error({required String message}) = _Error;
  const factory CategoryState.loading() = _Loading;
}
