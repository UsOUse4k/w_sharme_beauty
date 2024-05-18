// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunitySettingsWidget extends StatefulWidget {
  const CommunitySettingsWidget({
    super.key,
    required this.route,
    required this.communityId,
  });
  final String communityId;
  final GoRouter route;

  @override
  State<CommunitySettingsWidget> createState() =>
      _CommunitySettingsWidgetState();
}

class _CommunitySettingsWidgetState extends State<CommunitySettingsWidget> {
  String? groupId;

  @override
  void initState() {
    context
        .read<GetAllChatGroupBloc>()
        .add(const GetAllChatGroupEvent.getAllChatGroups());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.white,
      ),
      child: BlocListener<GetAllChatGroupBloc, GetAllChatGroupState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (groups) {
              try {
                final group = groups.firstWhere(
                  (element) => element.communityId == widget.communityId,
                );
                context.read<GetGroupBloc>().add(
                      GetGroupEvent.getGroup(
                        groupId: group.groupId.toString(),
                      ),
                    );
                context.read<ChatGroupCheckManagerBloc>().add(
                      ChatGroupCheckManagerEvent.getAllAdministrator(
                        administrator: group.administrator!,
                        editors: group.editors!,
                        groupId: group.groupId!,
                      ),
                    );
                groupId = group.groupId;
                setState(() {});
              } catch (e) {
                print('not found');
              }
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                ListTilleWidgetTextWith(
                  image: Assets.icons.edit.path,
                  title: 'Основной',
                  subTitle: 'Редактировать сообщество',
                  onPressed: () {
                    widget.route.push(
                      '/communities/community-profile/${widget.communityId}/${RouterContants.communityEdit}/${widget.communityId}',
                    );
                  },
                ),
                ListTilleWidgetTextWith(
                  image: Assets.icons.message.path,
                  title: 'Общение',
                  subTitle: 'Чаты',
                  onPressed: () {
                    if (groupId != null) {
                      widget.route.push(
                        '/communities/community-profile/${widget.communityId}/chatGroupMessages/$groupId',
                      );
                    } else {
                      showMyDialog(context, 'Сначала создайте чат!');
                    }
                  },
                ),
                ListTilleWidgetTextWith(
                  image: Assets.icons.managers.path,
                  title: 'Участники',
                  subTitle: 'Руководители',
                  onPressed: () {
                    if (groupId != null) {
                      widget.route.push(
                        '/communities/community-profile/${widget.communityId}/chatAdmins/$groupId',
                      );
                    } else {
                      showMyDialog(context, 'Сначала создайте чат!');
                    }
                  },
                ),
                ListTilleWidgetTextWith(
                  image: Assets.icons.subscribers.path,
                  subTitle: 'Подписчики',
                  onPressed: () {
                    if (groupId != null) {
                      widget.route.push(
                        '/communities/community-profile/${widget.communityId}/chatParticipants/$groupId',
                      );
                    } else {
                      showMyDialog(context, 'Сначала создайте чат!');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
