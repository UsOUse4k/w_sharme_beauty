import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community/entities.dart';

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
              avatar: widget.community.chatImageUrl,
              name: widget.community.chatGroupName.toString(),
              subTitle: "пусто",
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              // ignore: avoid_redundant_argument_values
              children: [
                // для отслеживания
              ],
            ),
            const Divider(
              color: AppColors.lightGrey,
              height: 1, 
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
