import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_chat_time.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class CardChatGroupWidget extends StatefulWidget {
  const CardChatGroupWidget({
    super.key,
    required this.groupId,
    required this.communityId,
  });

  final String groupId;
  final String communityId;

  @override
  State<CardChatGroupWidget> createState() => _CardChatGroupWidgetState();
}

class _CardChatGroupWidgetState extends State<CardChatGroupWidget> {
  @override
  void initState() {
    context.read<GetGroupBloc>().add(
          GetGroupEvent.getGroup(
            groupId: widget.groupId,
            communityId: widget.communityId,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return GestureDetector(
      onTap: () {
        router.push(
          '/home/chat/${RouterContants.chatGroupMessages}/${widget.groupId}/${widget.communityId}',
        );
      },
      child: BlocConsumer<GetGroupBloc, GetGroupState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (group, userProfiles) {
              context.read<ChatGroupCheckManagerBloc>().add(
                    ChatGroupCheckManagerEvent.getAllAdministrator(
                      administrator: group.administrator!,
                      editors: group.editors!,
                      groupId: group.groupId!,
                    ),
                  );
              context.read<GetAllGroupMessagesBloc>().add(
                    GetAllGroupMessagesEvent.getAllGroupMessages(
                      groupId: group.groupId.toString(),
                      communityId: widget.communityId,
                    ),
                  );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            success: (group, userProfiles) {
              final formatTime = formatChatTime(group.lastMessageTs!);
              final bool isCurrenUser =
                  firebaseAuth.currentUser!.uid == group.lastSenderId;

              return Container(
                height: 74,
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserAvatarWithName(
                      width: 60.w,
                      height: 60.h,
                      raduis: 30,
                      avatar: group.groupProfileImage,
                      name: group.groupName.toString(),
                      subTitle: group.lastMessage ?? "пусто",
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            if (isCurrenUser)
                              Icon(
                                group.seen != null && group.seen!
                                    ? Icons.done_all
                                    : Icons.check,
                                size: 16,
                                color: group.seen!
                                    ? AppColors.purple
                                    : AppColors.grey,
                              ),
                            Text(
                              formatTime,
                              style: AppStyles.w500f14
                                  .copyWith(color: AppColors.grey),
                            ),
                          ],
                        ),
                        if (!isCurrenUser &&
                            group.countMessage != null &&
                            group.countMessage! > 0)
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.purple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                '${group.countMessage}',
                                style: AppStyles.w400f14.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        Container(),
                      ],
                    ),
                  ],
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
