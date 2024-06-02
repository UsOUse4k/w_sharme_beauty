import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/notification.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class NotificationItemCard extends StatefulWidget {
  const NotificationItemCard({
    super.key,
    required this.item,
    required this.date,
    required this.typeText,
    required this.subscriptions,
  });

  final String date;
  final String typeText;
  final List<String> subscriptions;

  final NotificationModel item;

  @override
  State<NotificationItemCard> createState() => _NotificationItemCardState();
}

class _NotificationItemCardState extends State<NotificationItemCard> {
  bool isSubscribe = false;
  final currentUser = firebaseAuth.currentUser;

  @override
  void initState() {
    isSubscribe = widget.subscriptions.contains(widget.item.fromUser);
    super.initState();
  }

  void toggleSubscribe() {
    final bool newIsSubscribe = !isSubscribe;
    if (isSubscribe) {
      context.read<SubscribeBloc>().add(
            SubscribeEvent.unsubscribe(
              targetUserId: widget.item.fromUser.toString(),
            ),
          );
    } else {
      context.read<SubscribeBloc>().add(
            SubscribeEvent.subscribe(
              targetUserId: widget.item.fromUser.toString(),
            ),
          );
    }
    if (mounted) {
      setState(() {
        isSubscribe = newIsSubscribe;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.item.userAvatarUrl != null &&
              widget.item.userAvatarUrl != '')
            GestureDetector(
              onTap: () {
                context.push('/home/home-notification/profilePersonPage/${widget.item.fromUser}');
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                child: GlCachedNetworImage(
                  height: 48.h,
                  width: 48.w,
                  urlImage: widget.item.userAvatarUrl,
                ),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                context.push('');
              },
              child: GlCircleAvatar(
                avatar: Assets.images.notAvatar.path,
                width: 48.w,
                height: 48.w,
              ),
            ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.username.toString(),
                style: AppStyles.w500f18.copyWith(color: AppColors.black),
              ),
              SizedBox(
                width: 170.w,
                child: Text(
                  widget.typeText,
                  overflow: TextOverflow.clip,
                  style: AppStyles.w400f13,
                ),
              ),
              Text(
                widget.date,
                style: AppStyles.w400f14.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: widget.item.type == 'comment' || widget.item.type == 'like'
          ? widget.item.postImageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GlCachedNetworImage(
                    width: 48.w,
                    height: 48.h,
                    urlImage: widget.item.postImageUrl,
                  ),
                )
              : const SizedBox()
          : GlSubscribeButton(
              isSubscribe: isSubscribe,
              onPressed: toggleSubscribe,
            ),
    );
  }
}
