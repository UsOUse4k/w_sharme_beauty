import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class PostRepostButton extends StatelessWidget {
  const PostRepostButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
  });

  final String title;
  final Function() onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            width: 100.w,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Image.asset(
              icon,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
        const Gap(8),
        Text(title, style: AppStyles.w400f12),
      ],
    );
  }
}
