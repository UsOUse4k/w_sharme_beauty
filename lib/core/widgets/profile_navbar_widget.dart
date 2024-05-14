import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfileNavbarWidget extends StatelessWidget {
  const ProfileNavbarWidget({
    super.key,
    this.avatar,
    this.publications,
    this.followers,
    this.subscriptions,
    this.subscribeText = "Подписчиков",
    this.onPressedFollowers,
  });

  final String? avatar;
  final String? publications;
  final String? followers;
  final String? subscriptions;
  final String? subscribeText;
  final Function()? onPressedFollowers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (avatar != null)
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            child: GlCachedNetworImage(
              height: 100.h,
              width: 100.w,
              urlImage: avatar,
            ),
          )
        else
          GlCircleAvatar(
            avatar: Assets.images.ava.path,
            width: 100.w,
            height: 100.w,
          ),
        const SizedBox(
          width: 15,
        ),
        Column(
          children: [
            if (publications != null)
              Text(
                publications!,
                style: AppStyles.w500f16,
              ),
            if (publications != null)
              Text("Публикации", style: AppStyles.w400f14),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            if (followers != null) Text(followers!, style: AppStyles.w500f16),
            if (followers != null)
              GestureDetector(
                onTap: onPressedFollowers,
                child: Text(subscribeText!, style: AppStyles.w400f14),
              ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            if (subscriptions != null)
              Text(subscriptions!, style: AppStyles.w500f16),
            if (subscriptions != null)
              Text("Подписок", style: AppStyles.w400f14),
          ],
        ),
      ],
    );
  }
}
