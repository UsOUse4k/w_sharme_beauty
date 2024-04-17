import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class ProfileSettingItemWidget extends StatelessWidget {
  final String? title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool? isVisible;
  const ProfileSettingItemWidget({
    super.key,
    this.title,
    required this.subtitle,
    this.onTap,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          title: title == null
              ? null
              : Text(
                  title!,
                  style: AppStyles.w400f16.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
          subtitle: Text(
            subtitle,
            style: AppStyles.w400f16.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        if (isVisible == true)
          const Divider(
            color: AppColors.darkGrey,
            thickness: 0.5,
            height: 1,
          ),
      ],
    );
  }
}
