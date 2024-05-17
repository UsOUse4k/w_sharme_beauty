import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'get_all_admins_chat_group_event.dart';
part 'get_all_admins_chat_group_state.dart';
part 'get_all_admins_chat_group_bloc.freezed.dart';

@injectable
class GetAllAdminsChatGroupBloc
    extends Bloc<GetAllAdminsChatGroupEvent, GetAllAdminsChatGroupState> {
  GetAllAdminsChatGroupBloc(
    this._chatGroupRepository,
    this._authFacade,
  ) : super(const _Initial()) {
    on<GetAllAdminsChatGroupEvent>((event, emit) async {
      await event.maybeWhen(
        getAllAdminsChatGroup: (groupId) async {
          emit(const GetAllAdminsChatGroupState.loading());
          try {
            final dataGroup =
                await _chatGroupRepository.getGroup(groupId: groupId);
            await dataGroup.fold(
              (l) {
                emit(GetAllAdminsChatGroupState.error(message: l.messasge));
              },
              (data) async {
                final editors =
                    await _authFacade.getUserProfiles(userIds: data.editors!);
                final administrator = await _authFacade.getUserProfiles(
                  userIds: data.administrator!,
                );
                emit(
                  GetAllAdminsChatGroupState.success(
                    editors: editors,
                    administrator: administrator,
                  ),
                );
              },
            );
          } catch (e) {
            emit(GetAllAdminsChatGroupState.error(message: e.toString()));
          }
        },
        orElse: () {},
      );
    });
  }
  final IChatGroupRepository _chatGroupRepository;
  final IAuthFacade _authFacade;
}
