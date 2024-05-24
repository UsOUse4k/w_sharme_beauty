import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';

class UserAvatarWithName extends StatelessWidget {
  const UserAvatarWithName({
    super.key,
    required this.width,
    required this.height,
    this.avatar,
    required this.name,
    required this.subTitle,
    this.onPressed,
    this.raduis = 20,
  });
  final double? raduis;
  final double width;
  final double height;
  final String? avatar;
  final String name;
  final String subTitle;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (avatar != null)
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(raduis!),
              ),
              child: GlCachedNetworImage(
                height: height.h,
                width: width.w,
                urlImage: avatar,
              ),
            ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppStyles.w500f18.copyWith(color: AppColors.black),
              ),
              Text(
                subTitle,
                style: AppStyles.w400f14.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
