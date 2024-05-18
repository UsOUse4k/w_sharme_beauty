import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/subscribers_list_tile_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunityChatPage extends StatefulWidget {
  const CommunityChatPage({
    super.key,
    required this.communityId,
  });

  final String communityId;

  @override
  State<CommunityChatPage> createState() => _CommunityChatPageState();
}

class _CommunityChatPageState extends State<CommunityChatPage> {
  @override
  void initState() {
    context.read<GetAllChatGroupBloc>().add(
          const GetAllChatGroupEvent.getAllChatGroups(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Чаты',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: BlocConsumer<GetAllChatGroupBloc, GetAllChatGroupState>(
        listener: (context, state) {
          context
              .read<GetAllUsersBloc>()
              .add(const GetAllUsersEvent.getAllUsers());
        },
        builder: (context, state) {
          return state.maybeWhen(
            success: (groups) {
              final filterGroups = groups.where(
                (element) => element.communityId == widget.communityId,
              ).toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Чаты сообщества",
                    style:
                        AppStyles.w500f14.copyWith(color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: (users) {
                          return Row(
                            children: [
                              GlCircleAvatar(
                                avatar: Assets.icons.addChat.path,
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  if (filterGroups.isNotEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Группа создан!"),
                                      ),
                                    );
                                  } else {
                                    BottomSheetUtil.showAppBottomSheet(
                                      context,
                                      CustomBottomSheetLeading(
                                        maxHeight: 0.7,
                                        navbarTitle: "Создать группу",
                                        widget: AddedUsersChatGroupWidget(
                                          users: users,
                                          communityId: widget.communityId,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  "Создать чат",
                                  style: AppStyles.w400f16,
                                ),
                              ),
                            ],
                          );
                        },
                        orElse: () => Container(),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return groups[index].communityId == widget.communityId
                          ? SubscribersListTileWidget(
                              title: "${groups[index].groupName}",
                              subtitle:
                                  "${groups[index].joinedUserIds!.length} участников",
                              avatar:
                                  groups[index].groupProfileImage.toString(),
                            )
                          : const SizedBox();
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemCount: groups.length,
                  ),
                  const SizedBox(height: 10),
                  const Spacer(),
                  GlButton(text: "Сохранить", onPressed: () {}),
                  const SizedBox(height: 20),
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
