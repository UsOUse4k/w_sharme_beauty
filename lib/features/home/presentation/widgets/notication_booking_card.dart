import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/get_user_status.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';

class NotificationBookingCard extends StatelessWidget {
  const NotificationBookingCard({
    super.key,
    required this.user,
  });
  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    final statusUser = getUserStatus(user.lastSeen!);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: GlCachedNetworImage(
                  height: 50.h,
                  width: 50.w,
                  urlImage: user.profilePictureUrl,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.username.toString(),
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
        const Flexible(
          child: GlSubscribeButton(),
        ),
      ],
    );
  }
}
