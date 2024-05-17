part of 'get_all_admins_chat_group_bloc.dart';

@freezed
class GetAllAdminsChatGroupState with _$GetAllAdminsChatGroupState {
  const factory GetAllAdminsChatGroupState.initial() = _Initial;
  const factory GetAllAdminsChatGroupState.success({
    required List<UserProfile> editors,
    required List<UserProfile> administrator,
  }) = _Success;
  const factory GetAllAdminsChatGroupState.loading() = _Loading;
  const factory GetAllAdminsChatGroupState.error({required String message}) = _Error;
}
