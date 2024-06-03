// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';
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
  String? userId;
  @override
  void initState() {
    context.read<CommunityDetailBloc>().add(CommunityDetailEvent.loaded(widget.communityId));
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
      child: BlocListener<CommunityDetailBloc, CommunityDetailState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (community) {
              groupId = community.chatGroupId;
              setState(() {});
              print(groupId);
              
              //if (group.editors != null &&
              //    group.administrator != null &&
              //    group.groupId != null) {
              //  context.read<ChatGroupCheckManagerBloc>().add(
              //        ChatGroupCheckManagerEvent.getAllAdministrator(
              //          administrator: group.administrator!,
              //          editors: group.editors!,
              //          groupId: group.groupId!,
              //        ),
              //      );
              //  context.read<GetAllGroupMessagesBloc>().add(
              //        GetAllGroupMessagesEvent.getAllGroupMessages(
              //          groupId: group.groupId.toString(),
              //          communityId: group.communityId.toString(),
              //        ),
              //      );
              //}
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
                        '/communities/community-profile/${widget.communityId}/chatGroupMessages/$groupId/${widget.communityId}',
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
                        '/communities/community-profile/${widget.communityId}/chatAdmins/$groupId/${widget.communityId}',
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
                        '/communities/community-profile/${widget.communityId}/chatParticipants/$groupId/${widget.communityId}',
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
