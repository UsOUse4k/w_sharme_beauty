import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_admins_chat_group_bloc/get_all_admins_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_manager_chat_group_bloc/update_manager_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';

class ChatGroupAppointManagmentPage extends StatefulWidget {
  const ChatGroupAppointManagmentPage({
    super.key,
    required this.userId,
    required this.groupId,
    required this.communityId,
  });

  final String userId;
  final String groupId;
  final String communityId;

  @override
  State<ChatGroupAppointManagmentPage> createState() =>
      _ChatGroupAppointManagmentPageState();
}

class _ChatGroupAppointManagmentPageState
    extends State<ChatGroupAppointManagmentPage> {
  @override
  void initState() {
    context
        .read<UserDetailBloc>()
        .add(UserDetailEvent.getUserDetail(userId: widget.userId));
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
          title: 'Редактирование',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            success: (userData) {
              return BlocListener<UpdateManagerChatGroupBloc,
                  UpdateManagerChatGroupState>(
                listener: (context, state) {
                  state.maybeWhen(
                    success: () {
                      context.read<GetAllAdminsChatGroupBloc>().add(
                            GetAllAdminsChatGroupEvent.getAllAdminsChatGroup(
                              groupId: widget.groupId,
                              communityId: widget.communityId,
                            ),
                          );
                    },
                    orElse: () {},
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: BlocBuilder<ChatGroupCheckManagerBloc,
                      ChatGroupCheckManagerState>(
                    builder: (context, editState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 0.6,
                                  color: AppColors.grey,
                                ),
                                top: BorderSide(
                                  width: 0.6,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: GlCachedNetworImage(
                                  height: 50.h,
                                  width: 50.w,
                                  urlImage: userData.profilePictureUrl,
                                ),
                              ),
                              title: Text(
                                userData.username.toString(),
                                style: AppStyles.w500f18,
                              ),
                              subtitle: Text(
                                "Вы собираетесь назначить ${userData.username}\n руководителем сообщества",
                                style: AppStyles.w400f16
                                    .copyWith(color: AppColors.darkGrey),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Уровень полномочии",
                            style: AppStyles.w500f14.copyWith(
                              color: AppColors.darkGrey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListTileCheckbox(
                            isChecked: editState.editors.contains(userData.uid),
                            onChanged: (bool? value) {
                              if (value != null) {
                                context.read<ChatGroupCheckManagerBloc>().add(
                                      ChatGroupCheckManagerEvent
                                          .editManagerEditor(
                                        userId: userData.uid.toString(),
                                      ),
                                    );
                              }
                            },
                            title: 'Редактор',
                            subtitle:
                                'Может добавлять, удалять и редактировать контент, обновлять основную фотографию',
                          ),
                          ListTileCheckbox(
                            isChecked:
                                editState.administrator.contains(userData.uid),
                            onChanged: (bool? value) {
                              if (value != null) {
                                context.read<ChatGroupCheckManagerBloc>().add(
                                      ChatGroupCheckManagerEvent
                                          .editManagerAdministrator(
                                        userId: userData.uid.toString(),
                                      ),
                                    );
                              }
                            },
                            title: 'Администратор',
                            subtitle:
                                'Может назначать и снимать администраторов, изменять название сообщества, создать чат сообщества.',
                          ),
                          const Spacer(),
                          GlButton(
                            text: 'Сохранить',
                            onPressed: () {
                              context.read<UpdateManagerChatGroupBloc>().add(
                                    UpdateManagerChatGroupEvent
                                        .updateManagerChatGroup(
                                      groupId: widget.groupId,
                                      administrator: editState.administrator,
                                      editors: editState.editors,
                                      communityId: widget.communityId,
                                    ),
                                  );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
