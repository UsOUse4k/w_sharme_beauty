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
  List<UserProfile>? allProfiles;
  ChatGroupRoom? selectedGroup;

  GetGroupBloc(
    this._chatGroupRepository,
    this._authFacade,
  ) : super(const _Initial()) {
    on<GetGroupEvent>((event, emit) async {
      await event.maybeWhen(
        getGroup: (groupId, communityId) async {
          try {
            final result = await _chatGroupRepository.getGroup(
              groupId: groupId,
              communityId: communityId,
            );
            await result.fold((error) {
              emit(GetGroupState.error(message: error.messasge));
            }, (group) async {
              final userProfiles = await _authFacade.getUserProfiles(
                userIds: group.joinedUserIds!,
              );
              allProfiles = userProfiles;
              selectedGroup = group;
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
        searchUsers: (query) {
          if (state is _Success && allProfiles != null) {
            if (query.isEmpty) {
              emit(
                GetGroupState.success(
                  userProfiles: allProfiles!,
                  group: selectedGroup!,
                ),
              );
            } else {
              final filteredUsers = allProfiles!
                  .where(
                    (user) => user.username!
                        .toLowerCase()
                        .contains(query.toLowerCase()),
                  )
                  .toList();
              emit(
                GetGroupState.success(
                  userProfiles: filteredUsers,
                  group: selectedGroup!,
                ),
              );
            }
          }
        },
        orElse: () {},
      );
    });
  }
  final IAuthFacade _authFacade;
  final IChatGroupRepository _chatGroupRepository;
}
