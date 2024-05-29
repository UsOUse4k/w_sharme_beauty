part of 'community_category_bloc.dart';

@freezed
class CommunityCategoryState with _$CommunityCategoryState {
  const factory CommunityCategoryState.selected({
    @Default([]) List<String> selectedTitle,
  }) = _Selected;
}
