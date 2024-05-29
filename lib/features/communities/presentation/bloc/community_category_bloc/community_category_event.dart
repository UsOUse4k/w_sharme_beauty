part of 'community_category_bloc.dart';

@freezed
class CommunityCategoryEvent with _$CommunityCategoryEvent {
  const factory CommunityCategoryEvent.loaded(List<String> title) = _Loaded;
  const factory CommunityCategoryEvent.toggleUserSelection(String title) =
      _ToggleUserSelection;
}
