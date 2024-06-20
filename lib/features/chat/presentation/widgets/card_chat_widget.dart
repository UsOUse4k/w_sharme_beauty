import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/chat_room.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';

class CardChatWidget extends StatelessWidget {
  const CardChatWidget({
    super.key,
    required this.userId,
    required this.chatRooms,
  });

  final String userId;

  final ChatRoom chatRooms;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Column(
      children: [
        Container(
          height: 73.h,
          padding: const EdgeInsets.only(
            top: 10,
            right: 18,
            bottom: 10,
          ),
          child: InkWell(
            onTap: () {
              router.push(
                '/home/chat/${RouterContants.chatMessages}/$userId',
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAvatarWithName(
                  width: 60.w,
                  height: 60.h,
                  raduis: 30,
                  avatar: chatRooms.receiverUserAvatar,
                  name: chatRooms.receiverUsername.toString(),
                  subTitle: chatRooms.lastMessage ?? "пусто",
                ),
                MessageCheckTimeTextWidget(
                  userId: userId,
                  chatRoom: chatRooms,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 55.w,
          ),
          child: const Divider(
            color: AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
