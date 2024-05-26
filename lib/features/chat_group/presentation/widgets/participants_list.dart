import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/utils/format_date/get_user_status.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

class ParticipantsList extends StatelessWidget {
  const ParticipantsList({super.key, required this.userProfiles, required this.group});

  final List<UserProfile> userProfiles;
  final ChatGroupRoom group;


  @override
  Widget build(BuildContext context) {
    final currentUser = firebaseAuth.currentUser;
    return ListView.builder(
      itemCount: userProfiles.length,
      itemBuilder: (BuildContext context, int index) {
        final formatDate = getUserStatus(userProfiles[index].lastSeen!);
        return SubscribersListTileWidget(
          title: userProfiles[index].username.toString(),
          subtitle: formatDate,
          avatar: userProfiles[index].profilePictureUrl.toString(),
          onTap: () {
            if (group.userId == group.joinedUserIds![index]) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Владелец',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            } else {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (ctx) => ShowModalBottomSheetWidget(
                  text1: 'Назначить руководителем',
                  onTap1: () {
                    if (group.userId == currentUser!.uid ||
                        group.administrator != null &&
                            group.administrator!.contains(
                                  currentUser.uid,
                                ) ==
                                true) {
                      Navigator.pop(context);
                      context.push(
                        '/home/chat/chatGroupMessages/${group.groupId}/${group.communityId}/chatParticipants/${group.groupId}/${group.communityId}/appointManagment/${userProfiles[index].uid}/${group.userId}/${group.communityId}',
                      );
                    } else {
                      showMyDialog(
                        context,
                        'У Вас нет права!',
                      );
                    }
                  },
                  text2: 'Удалить из сообщества',
                  onTap2: () {
                    if (group.userId == currentUser!.uid ||
                        group.administrator != null &&
                            group.administrator!.contains(
                                  currentUser.uid,
                                ) ==
                                true ||
                        group.editors != null &&
                            group.editors!.contains(
                                  currentUser.uid,
                                ) ==
                                true) {
                      context.read<RemoveAdminChatGroupBloc>().add(
                            RemoveAdminChatGroupEvent.removeAdmin(
                              communityId: group.communityId.toString(),
                              userId: userProfiles[index].uid.toString(),
                              groupId: group.groupId ?? '',
                              type: 'user',
                            ),
                          );
                    } else {
                      showMyDialog(
                        context,
                        'У Вас нет права!',
                      );
                    }
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
