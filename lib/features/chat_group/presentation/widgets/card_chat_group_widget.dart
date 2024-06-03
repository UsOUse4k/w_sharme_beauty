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
    final bool isCurrenUser =
        firebaseAuth.currentUser!.uid == community.lastSenderId.toString();
    final formatTime = formatChatTime(community.lastMessageTs!);
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
                  subTitle: community.lastMessage ?? '',
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: avoid_redundant_argument_values
                  children: [
                    Row(
                      children: [
                        if (isCurrenUser)
                          Icon(
                            community.seen != null && community.seen!
                                ? Icons.done_all
                                : Icons.check,
                            size: 16,
                            color: community.seen!
                                ? AppColors.purple
                                : AppColors.grey,
                          ),
                        Text(
                          formatTime,
                          style:
                              AppStyles.w500f14.copyWith(color: AppColors.grey),
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
