import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class TitledWidget extends StatelessWidget {
  const TitledWidget({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.w500f14.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        const Gap(10),
        child,
      ],
    );
  }
}
