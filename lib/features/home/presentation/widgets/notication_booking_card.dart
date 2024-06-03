import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/get_user_status.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/create_notification_bloc/create_notification_bloc.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/subscribe_bloc/subscribe_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class NotificationBookingCard extends StatefulWidget {
  const NotificationBookingCard({
    super.key,
    required this.user, this.onPressed,
  });
  final UserProfile user;
  final Function()? onPressed;


  @override
  State<NotificationBookingCard> createState() =>
      _NotificationBookingCardState();
}

class _NotificationBookingCardState extends State<NotificationBookingCard> {
  bool isSubscribe = false;
  final currentUser = firebaseAuth.currentUser;

  @override
  void initState() {
    isSubscribe = widget.user.followers!.contains(currentUser!.uid);
    super.initState();
  }

  void toggleSubscribe() {
    final bool newIsSubscribe = !isSubscribe;
    if (isSubscribe) {
      context.read<SubscribeBloc>().add(
            SubscribeEvent.unsubscribe(
              targetUserId: widget.user.uid.toString(),
            ),
          );
    } else {
      context.read<SubscribeBloc>().add(
            SubscribeEvent.subscribe(
              targetUserId: widget.user.uid.toString(),
            ),
          );
      context.read<CreateNotificationBloc>().add(
          CreateNotificationEvent.created(
              type: 'subscribe',
              fromUser: widget.user.uid.toString(),
              contentId: widget.user.uid.toString(),),);
    }
    if (mounted) {
      setState(() {
        isSubscribe = newIsSubscribe;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusUser = widget.user.lastSeen != null
        ? getUserStatus(widget.user.lastSeen!)
        : 'Неизвестно';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.user.profilePictureUrl != '')
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: GlCachedNetworImage(
                      height: 50.h,
                      width: 50.w,
                      urlImage: widget.user.profilePictureUrl,
                    ),
                  )
                else
                  GlCircleAvatar(
                    avatar: Assets.images.notAvatar.path,
                    width: 50.w,
                    height: 50.w,
                  ),
                const SizedBox(width: 8),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.username.toString(),
                        style: AppStyles.w500f16,
                      ),
                      Text(
                        statusUser,
                        overflow: TextOverflow.clip,
                        style: AppStyles.w400f14.copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: widget.user.uid != currentUser!.uid
              ? GlSubscribeButton(
                  isSubscribe: isSubscribe,
                  onPressed: toggleSubscribe,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
