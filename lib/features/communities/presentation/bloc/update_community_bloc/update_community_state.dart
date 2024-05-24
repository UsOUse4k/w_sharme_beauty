part of 'update_community_bloc.dart';

@freezed
class UpdateCommunityState with _$UpdateCommunityState {
  const factory UpdateCommunityState.initial() = _Initial;
  const factory UpdateCommunityState.loading() = _Loading;
  const factory UpdateCommunityState.error({required String message}) = _Error;
  const factory UpdateCommunityState.succes() = _Success;
}
