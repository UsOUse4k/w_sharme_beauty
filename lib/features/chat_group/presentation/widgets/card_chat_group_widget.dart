import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/user_avatar.dart';
import 'package:w_sharme_beauty/core/widgets/user_name_and_text.dart';
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
        height: 90.h,
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                UserAvatar(
                  width: 60.w,
                  height: 60.h,
                  raduis: 30,
                  avatar: widget.community.chatImageUrl,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UserNameAndText(
                            name: widget.community.chatGroupName.toString(),
                            subTitle: "пусто",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 55,
              ),
              child: Divider(
                color: AppColors.lightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
