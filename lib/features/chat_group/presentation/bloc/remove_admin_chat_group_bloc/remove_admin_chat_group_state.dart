part of 'remove_admin_chat_group_bloc.dart';

@freezed
class RemoveAdminChatGroupState with _$RemoveAdminChatGroupState {
  const factory RemoveAdminChatGroupState.initial() = _Initial;
  const factory RemoveAdminChatGroupState.loading() = _Loading;
  const factory RemoveAdminChatGroupState.success() = _Success;
  const factory RemoveAdminChatGroupState.error({required String message}) = _Error;

}
