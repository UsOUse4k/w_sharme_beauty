// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/Invite_people_to_chat.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ChatManagmentWidget extends StatelessWidget {
  const ChatManagmentWidget({
    super.key,
    required this.groupRoom,
  });

  final ChatGroupRoom groupRoom;

  @override
  Widget build(BuildContext context) {
    context.watch<GetAllUsersBloc>().add(const GetAllUsersEvent.getAllUsers());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (users) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTilleWidgetTextWith(
                    onPressed: () {},
                    subTitle: 'Редактировать чат',
                    title: 'Основное',
                    image: Assets.icons.edit.path,
                  ),
                  ListTilleWidgetTextWith(
                    onPressed: () {},
                    subTitle: 'Руководители',
                    title: 'Участники',
                    image: Assets.icons.managers.path,
                  ),
                  ListTilleWidgetTextWith(
                    onPressed: () {
                      context.push(
                        '/home/chat/chatGroupMessages/${groupRoom.groupId}/chatParticipants/${groupRoom.groupId}',
                      );
                    },
                    subTitle: 'Участники',
                    image: Assets.icons.subscribers.path,
                  ),
                  ListTilleWidgetTextWith(
                    onPressed: () {
                      BottomSheetUtil.showAppBottomSheet(
                        context,
                        CustomBottomSheetLeading(
                          maxHeight: 0.7,
                          navbarTitle: 'Пригласить людей в чат',
                          widget: InvitePeopleToChat(
                            users: users,
                          ),
                        ),
                        closeCurrent: true,
                      );
                    },
                    subTitle: 'Пригласить людей в чат',
                    title: 'Приглашение',
                    image: Assets.icons.addPeople.path,
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
