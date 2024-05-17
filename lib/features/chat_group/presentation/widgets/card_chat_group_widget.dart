import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_chat_time.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class CardChatGroupWidget extends StatelessWidget {
  const CardChatGroupWidget({
    super.key,
    required this.groupId,
    required this.groupRoom,
  });

  final String groupId;

  final ChatGroupRoom groupRoom;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final formatTime = formatChatTime(groupRoom.lastMessageTs!);
    final bool isCurrenUser =
        firebaseAuth.currentUser!.uid == groupRoom.lastSenderId;

    return GestureDetector(
      onTap: () {
        router.push(
          '/home/chat/${RouterContants.chatGroupMessages}/$groupId',
        );
      },
      child: Container(
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
              avatar: groupRoom.groupProfileImage,
              name: groupRoom.groupName.toString(),
              subTitle: groupRoom.lastMessage ?? "пусто",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    if (isCurrenUser)
                      Icon(
                        groupRoom.seen != null && groupRoom.seen!
                            ? Icons.done_all
                            : Icons.check,
                        size: 16,
                        color:
                            groupRoom.seen! ? AppColors.purple : AppColors.grey,
                      ),
                    Text(
                      formatTime,
                      style: AppStyles.w500f14.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
                if (!isCurrenUser &&
                    groupRoom.countMessage != null &&
                    groupRoom.countMessage! > 0)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${groupRoom.countMessage}',
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
      ),
    );
  }
}
