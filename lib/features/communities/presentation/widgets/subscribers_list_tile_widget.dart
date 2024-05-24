import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class SubscribersListTileWidget extends StatelessWidget {
  const SubscribersListTileWidget({
    super.key,
    this.onTap,
    required this.avatar,
    required this.title,
    required this.subtitle,
  });
  final Function()? onTap;
  final String avatar;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: GlCachedNetworImage(
          height: 50.h,
          width: 50.w,
          urlImage: avatar,
        ),
      ),
      title: Text(title, style: AppStyles.w500f18),
      subtitle: Text(
        subtitle,
        style: AppStyles.w400f16.copyWith(color: AppColors.darkGrey),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          Assets.icons.moreHoriz.path,
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}
