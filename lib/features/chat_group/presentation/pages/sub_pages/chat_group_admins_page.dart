// ignore_for_file: collection_methods_unrelated_type

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_admins_sorted_bloc/get_admins_sorted_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/admins_list.dart';

class ChatGroupAdminsPage extends StatefulWidget {
  const ChatGroupAdminsPage({
    super.key,
    required this.groupId,
    this.communityId,
  });

  final String groupId;
  final String? communityId;

  @override
  State<ChatGroupAdminsPage> createState() => _ChatGroupAdminsPageState();
}

class _ChatGroupAdminsPageState extends State<ChatGroupAdminsPage> {
  @override
  void initState() {
    context.read<GetAllAdminsChatGroupBloc>().add(
          GetAllAdminsChatGroupEvent.getAllAdminsChatGroup(
            groupId: widget.groupId,
            communityId: widget.communityId!,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Руководители',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<GetGroupBloc, GetGroupState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (group, userProfiles) {
                final UserProfile owner = userProfiles.firstWhere(
                  (element) => element.uid == group.userId,
                );
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: BlocListener<RemoveAdminChatGroupBloc,
                      RemoveAdminChatGroupState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: () {
                          context.read<GetAllAdminsChatGroupBloc>().add(
                                GetAllAdminsChatGroupEvent
                                    .getAllAdminsChatGroup(
                                  groupId: widget.groupId,
                                  communityId: widget.communityId!,
                                ),
                              );
                        },
                        orElse: () {},
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        SearchWidget(
                          onChanged: (value) {
                            context.read<GetAdminsSortedBloc>().add(
                                GetAdminsSortedEvent.searchUsers(query: value),);
                          },
                        ),
                        BlocBuilder<GetAllAdminsChatGroupBloc,
                            GetAllAdminsChatGroupState>(
                          builder: (context, dataState) {
                            return dataState.maybeWhen(
                              success: (editors, administrator) {
                                final sortedBloc =
                                    context.read<GetAdminsSortedBloc>();
                                sortedBloc.add(
                                  GetAdminsSortedEvent.sortAdmins(
                                    owner: owner,
                                    administrators: administrator,
                                    editors: editors,
                                  ),
                                );
                                return BlocBuilder<GetAdminsSortedBloc,
                                    GetAdminsSortedState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      sorted: (sortedAdmins) {
                                        return AdminsList(
                                          sortedAdmins: sortedAdmins,
                                          owner: owner,
                                          administrator: administrator,
                                          group: group,
                                        );
                                      },
                                      orElse: () => Container(),
                                    );
                                  },
                                );
                              },
                              orElse: () => Container(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
