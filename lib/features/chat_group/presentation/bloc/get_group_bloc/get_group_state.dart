part of 'get_group_bloc.dart';

@freezed
class GetGroupState with _$GetGroupState {
  const factory GetGroupState.initial() = _Initial;
  const factory GetGroupState.loading() = _Loading;
  const factory GetGroupState.success({required ChatGroupRoom group}) = _Success;
  const factory GetGroupState.error({required String message}) = _Error;
}
