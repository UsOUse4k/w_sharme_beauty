import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/auth/domain/repositories/i_auth_facade.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/repositories/i_chat_group_repository.dart';

part 'get_group_event.dart';
part 'get_group_state.dart';
part 'get_group_bloc.freezed.dart';

@injectable
class GetGroupBloc extends Bloc<GetGroupEvent, GetGroupState> {
  GetGroupBloc(
    this._chatGroupRepository,
    this._authFacade,
  ) : super(const _Initial()) {
    on<GetGroupEvent>((event, emit) async {
      await event.maybeWhen(
        getGroup: (groupId) async {
          try {
            final result = await _chatGroupRepository.getGroup(
              groupId: groupId,
            );
            await result.fold((error) {
              emit(GetGroupState.error(message: error.messasge));
            }, (group) async {
              final userProfiles = await _authFacade.getUserProfiles(
                userIds: group.joinedUserIds!,
              );
              emit(
                GetGroupState.success(
                  group: group,
                  userProfiles: userProfiles,
                ),
              );
            });
          } catch (e) {
            emit(
              GetGroupState.error(
                message: e.toString(),
              ),
            );
          }
        },
        orElse: () {},
      );
    });
  }
  final IAuthFacade _authFacade;
  final IChatGroupRepository _chatGroupRepository;
}
