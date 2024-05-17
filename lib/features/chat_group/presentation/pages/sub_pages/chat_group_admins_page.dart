import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

class ChatGroupAdminsPage extends StatefulWidget {
  const ChatGroupAdminsPage({super.key, required this.groupId});

  final String groupId;

  @override
  State<ChatGroupAdminsPage> createState() => _ChatGroupAdminsPageState();
}

class _ChatGroupAdminsPageState extends State<ChatGroupAdminsPage> {
  @override
  void initState() {
    context.read<GetAllAdminsChatGroupBloc>().add(
          GetAllAdminsChatGroupEvent.getAllAdminsChatGroup(
            groupId: widget.groupId,
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
                                ),
                              );
                        },
                        orElse: () {},
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        const SearchWidget(),
                        BlocBuilder<GetAllAdminsChatGroupBloc,
                            GetAllAdminsChatGroupState>(
                          builder: (context, dataState) {
                            return dataState.maybeWhen(
                              success: (editors, administrator) {
                                final Set<UserProfile> uniqueAdmins = {
                                  owner,
                                  ...administrator,
                                  ...editors,
                                };
                                final List<UserProfile> admins =
                                    uniqueAdmins.toList();
                                final List<UserProfile> sortedAdmins = [
                                  ...administrator,
                                  ...admins.where(
                                    (item) => !administrator.contains(item),
                                  ),
                                ];

                                return ListView.separated(
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
                                    return SubscribersListTileWidget(
                                      avatar: item.profilePictureUrl.toString(),
                                      title: item.username.toString(),
                                      subtitle: subtitleText,
                                      onTap: () {
                                        if (group.userId == item.uid) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
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
                                            builder: (ctx) =>
                                                ShowModalBottomSheetWidget(
                                              text1: 'Редактировать',
                                              onTap1: () {
                                                context.push(
                                                  '/home/chat/chatGroupMessages/${widget.groupId}/chatAdmins/${widget.groupId}/appointManagment/${item.uid}/${group.userId}',
                                                );
                                              },
                                              text2: 'Разжаловать',
                                              onTap2: () {
                                                context
                                                    .read<
                                                        RemoveAdminChatGroupBloc>()
                                                    .add(
                                                      RemoveAdminChatGroupEvent
                                                          .removeAdmin(
                                                        userId:
                                                            item.uid.toString(),
                                                        groupId: widget.groupId,
                                                        type: 'admin',
                                                      ),
                                                    );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: admins.length,
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
