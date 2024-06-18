import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class AdvertsIconButton extends StatelessWidget {
  const AdvertsIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  final String text;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: icon,
          ),
          const Gap(6),
          Text(
            text,
            style: AppStyles.w400f14,
          ),
        ],
      ),
    );
  }
}
