import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

class AdminsList extends StatelessWidget {
  const AdminsList({
    super.key,
    required this.sortedAdmins,
    required this.owner,
    required this.administrator,
    required this.group,
  });

  final List<UserProfile> sortedAdmins;
  final UserProfile owner;
  final List<UserProfile> administrator;
  final ChatGroupRoom group;

  @override
  Widget build(BuildContext context) {
    final currenUser = firebaseAuth.currentUser;
    return ListView.separated(
      itemCount: sortedAdmins.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = sortedAdmins[index];
        String subtitleText;
        if (item == owner) {
          subtitleText = 'Владелец чата';
        } else if (administrator.contains(item)) {
          subtitleText = 'Администратор';
        } else {
          subtitleText = 'Редактор';
        }
        return BlocBuilder<CommunityDetailBloc, CommunityDetailState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (community) {
                return SubscribersListTileWidget(
                  avatar: item.profilePictureUrl ?? '',
                  title: item.username ?? '',
                  subtitle: subtitleText,
                  onTap: () {
                    if (group.userId == item.uid) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(
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
                          text1: 'Редактировать',
                          onTap1: () {
                            if ((community.uid == currenUser!.uid) ||
                                (community.administrator != null &&
                                    community.administrator!.contains(
                                          currenUser.uid,
                                        ) ==
                                        true)) {
                              context.push(
                                '/home/chat/chatGroupMessages/${group.groupId}/${group.communityId}/chatAdmins/${group.groupId}/${group.communityId}/appointManagment/${item.uid}/${group.groupId}/${group.communityId}',
                              );
                            } else {
                              showMyDialog(
                                context,
                                'У вас нет права!',
                              );
                            }
                          },
                          text2: 'Разжаловать',
                          onTap2: () {
                            if ((community.uid == currenUser!.uid) ||
                                (community.administrator != null &&
                                    community.administrator!.contains(
                                          currenUser.uid,
                                        ) ==
                                        true)) {
                              context.read<RemoveAdminChatGroupBloc>().add(
                                    RemoveAdminChatGroupEvent.removeAdmin(
                                      communityId:
                                          group.communityId.toString(),
                                      userId: item.uid.toString(),
                                      groupId: group.groupId ?? '',
                                      type: 'admin',
                                    ),
                                  );
                            } else {
                              showMyDialog(
                                context,
                                'У вас нет права!',
                              );
                            }
                          },
                        ),
                      );
                    }
                  },
                );
              },
              orElse: () => Container(),
            );
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
