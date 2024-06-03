import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_chat_time.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community/entities.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class CardChatGroupWidget extends StatefulWidget {
  const CardChatGroupWidget({
    super.key,
    required this.groupId,
    required this.communityId,
    required this.community,
  });

  final String groupId;
  final String communityId;
  final Community community;

  @override
  State<CardChatGroupWidget> createState() => _CardChatGroupWidgetState();
}

class _CardChatGroupWidgetState extends State<CardChatGroupWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isCurrenUser =
        firebaseAuth.currentUser!.uid == widget.community.lastSenderId;
    final community = widget.community;
    final formatTime = formatChatTime(community.lastMessageTs!);

    final router = GoRouter.of(context);
    return GestureDetector(
      onTap: () {
        router.push(
          '/home/chat/${RouterContants.chatGroupMessages}/${widget.groupId}/${widget.communityId}',
        );
      },
      child: Container(
        height: 73.h,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAvatarWithName(
              width: 60.w,
              height: 60.h,
              raduis: 30,
              avatar: community.chatImageUrl,
              name: community.chatGroupName.toString(),
              subTitle: community.lastMessage.toString(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    if (isCurrenUser)
                      Icon(
                        community.seen != null && community.seen!
                            ? Icons.done_all
                            : Icons.check,
                        size: 16,
                        color:
                            community.seen! ? AppColors.purple : AppColors.grey,
                      ),
                    Text(
                      formatTime,
                      style: AppStyles.w500f14.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
                if (!isCurrenUser &&
                    community.messageCount != null &&
                    community.messageCount! > 0)
                  Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${community.messageCount}',
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
