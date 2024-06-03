import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

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
    this.date, this.subStyle,
  });
  final double? raduis;
  final double width;
  final double height;
  final String? avatar;
  final String? date;
  final TextStyle? subStyle;


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
          if (avatar != null && avatar != '')
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(raduis!),
              ),
              child: GlCachedNetworImage(
                height: height.h,
                width: width.w,
                urlImage: avatar,
              ),
            )
          else
            GlCircleAvatar(
              avatar: Assets.images.notAvatar.path,
              width: height.w,
              height: width.w,
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
                overflow: TextOverflow.ellipsis,
                style: subStyle ??  AppStyles.w400f14.copyWith(color: AppColors.grey),
              ),
              if (date != null)
                Text(
                  date.toString(),
                  style: AppStyles.w400f14.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
