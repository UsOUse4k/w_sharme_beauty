part of 'get_all_admins_chat_group_bloc.dart';

@freezed
class GetAllAdminsChatGroupEvent with _$GetAllAdminsChatGroupEvent {
  const factory GetAllAdminsChatGroupEvent.getAllAdminsChatGroup({
    required String groupId,
  }) = _GetAllAdminsChatGroup;
}
