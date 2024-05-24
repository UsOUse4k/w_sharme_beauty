import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_chat_time.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/chat_room.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class MessageCheckTimeTextWidget extends StatelessWidget {
  const MessageCheckTimeTextWidget({
    super.key,
    required this.chatRoom,
    required this.userId,
  });

  final ChatRoom chatRoom;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final formatTime = formatChatTime(chatRoom.lastMessageTs!);
    final bool isCurrenUser =
        firebaseAuth.currentUser!.uid == chatRoom.lastSenderId;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            if (isCurrenUser)
              Icon(
                chatRoom.seen != null && chatRoom.seen!
                    ? Icons.done_all
                    : Icons.check,
                size: 16,
                color: chatRoom.seen! ? AppColors.purple : AppColors.grey,
              ),
            Text(
              formatTime,
              style: AppStyles.w500f14.copyWith(color: AppColors.grey),
            ),
          ],
        ),
        if (!isCurrenUser &&
            chatRoom.messageCount != null &&
            chatRoom.messageCount! > 0)
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '${chatRoom.messageCount}',
                style: AppStyles.w400f14.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        Container(),
      ],
    );
  }
}
