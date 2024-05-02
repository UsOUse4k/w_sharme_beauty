part of 'communities_list_bloc.dart';

@freezed
class CommunitiesListState with _$CommunitiesListState {
  const factory CommunitiesListState.initial() = _Initial;

  const factory CommunitiesListState.loading() = _LoadingCommunitiesList;

  const factory CommunitiesListState.loaded({
    required List<Communities> communities,
  }) = _LoadedCommunitiesList;

  const factory CommunitiesListState.error({required String message}) =
      _ErrorCommunitiesList;
}
