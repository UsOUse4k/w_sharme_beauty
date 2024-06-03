import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class UserNameAndText extends StatelessWidget {
  const UserNameAndText({
    super.key,
    required this.name,
    required this.subTitle,
  });

  final String name;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
