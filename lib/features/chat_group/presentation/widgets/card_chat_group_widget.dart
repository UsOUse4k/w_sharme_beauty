import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community/entities.dart';

class CardChatGroupWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Column(
      children: [
        Container(
          height: 73.h,
          padding: const EdgeInsets.only(right: 18, top: 10, bottom: 10),
          child: InkWell(
            onTap: () {
              router.push(
                '/home/chat/${RouterContants.chatGroupMessages}/$groupId/$communityId',
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
                  avatar: community.chatImageUrl,
                  name: community.chatGroupName.toString(),
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
