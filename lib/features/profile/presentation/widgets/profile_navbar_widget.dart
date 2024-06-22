import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';

class ProfileNavbarWidget extends StatelessWidget {
  const ProfileNavbarWidget({
    super.key,
    this.avatar,
    this.publications,
    this.followers,
    this.subscriptions,
    this.subscribeText = "Подписчиков",
    this.onPressedFollowers,
    this.onPressedSubscribe,
  });

  final String? avatar;
  final String? publications;
  final String? followers;
  final String? subscriptions;
  final String? subscribeText;
  final Function()? onPressedFollowers;
  final Function()? onPressedSubscribe;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlCircleAvatar(
          avatar: avatar.toString(),
          width: 90.w,
          height: 90.w,
        ),
        SizedBox(width: 20.w),
        Column(
          children: [
            if (publications != null)
              Text(
                publications!,
                style: AppStyles.w500f22,
              ),
            if (publications != null)
              Text(
                "Публикации",
                style: AppStyles.w400f14.copyWith(color: AppColors.darkGrey),
              ),
          ],
        ),
        SizedBox(width: 22.w),
        Column(
          children: [
            if (followers != null)
              GestureDetector(
                onTap: onPressedFollowers,
                child: Column(
                  children: [
                    Text(followers!, style: AppStyles.w500f22),
                    Text(
                      subscribeText!,
                      style:
                          AppStyles.w400f14.copyWith(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
          ],
        ),
        SizedBox(width: 22.w),
        Column(
          children: [
            if (subscriptions != null)
              GestureDetector(
                onTap: onPressedSubscribe,
                child: Column(
                  children: [
                    Text(subscriptions!, style: AppStyles.w500f22),
                    Text(
                      "Подписок",
                      style:
                          AppStyles.w400f14.copyWith(color: AppColors.darkGrey),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
