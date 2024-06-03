part of 'get_user_detail_bloc.dart';

@freezed
class GetUserDetailState with _$GetUserDetailState {
   const factory GetUserDetailState.initial() = _Initial;
  const factory GetUserDetailState.success(UserProfile userData) = _Success;
  const factory GetUserDetailState.loading() = _Loading;
  const factory GetUserDetailState.error({required String message}) = _Error;
}
