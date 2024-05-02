part of 'communities_list_bloc.dart';

@freezed
class CommunitiesListEvent with _$CommunitiesListEvent {
  const factory CommunitiesListEvent.started() = _StartedCommunitiesList;

  const factory CommunitiesListEvent.get() = _GetCommunitiesList;
}
