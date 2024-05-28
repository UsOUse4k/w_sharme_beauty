// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/filter_users_invite/filter_users_invite_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/Invite_people_to_chat.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ChatManagmentWidget extends StatefulWidget {
  const ChatManagmentWidget({
    super.key,
    required this.groupRoom,
    required this.communityId,
  });

  final ChatGroupRoom groupRoom;
  final String communityId;

  @override
  State<ChatManagmentWidget> createState() => _ChatManagmentWidgetState();
}

class _ChatManagmentWidgetState extends State<ChatManagmentWidget> {
  @override
  void initState() {
    context.read<GetAllUsersBloc>().add(const GetAllUsersEvent.getAllUsers());
    context
        .read<CommunityDetailBloc>()
        .add(CommunityDetailEvent.loaded(widget.communityId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = firebaseAuth.currentUser;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: BlocConsumer<GetAllUsersBloc, GetAllUsersState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (users) {
              context
                  .read<FilterUsersInviteBloc>()
                  .add(FilterUsersInviteEvent.loaded(users, currentUser!.uid));
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            success: (users) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTilleWidgetTextWith(
                    onPressed: () {
                      context.push(
                        '/home/chat/chatGroupMessages/${widget.groupRoom.groupId}/${widget.communityId}/chatGroupEdit/${widget.groupRoom.groupId}/${widget.communityId}',
                      );
                    },
                    subTitle: 'Редактировать чат',
                    title: 'Основное',
                    image: Assets.icons.edit.path,
                  ),
                  ListTilleWidgetTextWith(
                    onPressed: () {
                      context.push(
                        '/home/chat/chatGroupMessages/${widget.groupRoom.groupId}/${widget.communityId}/chatAdmins/${widget.groupRoom.groupId}/${widget.communityId}',
                      );
                    },
                    subTitle: 'Руководители',
                    title: 'Участники',
                    image: Assets.icons.managers.path,
                  ),
                  ListTilleWidgetTextWith(
                    onPressed: () {
                      context.push(
                        '/home/chat/chatGroupMessages/${widget.groupRoom.groupId}/${widget.communityId}/chatParticipants/${widget.groupRoom.groupId}/${widget.communityId}',
                      );
                    },
                    subTitle: 'Участники',
                    image: Assets.icons.subscribers.path,
                  ),
                  BlocBuilder<CommunityDetailBloc, CommunityDetailState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: (community) {
                          return ListTilleWidgetTextWith(
                            onPressed: () {
                              if (currentUser!.uid == community.uid ||
                                  (community.administrator != null &&
                                      community.administrator!
                                              .contains(currentUser.uid) ==
                                          true) ||
                                  (community.editors != null &&
                                      community.editors!
                                              .contains(currentUser.uid) ==
                                          true)) {
                                BottomSheetUtil.showAppBottomSheet(
                                  context,
                                  CustomBottomSheetLeading(
                                    maxHeight: 0.7,
                                    navbarTitle: 'Пригласить людей в чат',
                                    widget: BlocBuilder<FilterUsersInviteBloc,
                                        FilterUsersInviteState>(
                                      builder: (context, state) {
                                        return state.maybeWhen(
                                          filterUsers: (filterUsers) {
                                            return InvitePeopleToChat(
                                              communityId: widget.communityId,
                                              users: filterUsers,
                                              groupId: widget.groupRoom.groupId
                                                  .toString(),
                                            );
                                          },
                                          orElse: () => Container(),
                                        );
                                      },
                                    ),
                                  ),
                                  closeCurrent: true,
                                );
                              } else {
                                showMyDialog(context, 'У вас нет права!');
                              }
                            },
                            subTitle: 'Пригласить людей в чат',
                            title: 'Приглашение',
                            image: Assets.icons.addPeople.path,
                          );
                        },
                        orElse: () => Container(),
                      );
                    },
                  ),
                ],
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
