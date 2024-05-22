import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.wrapText,
  });
  final String wrapText;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
        child: Text(
          wrapText,
          style: AppStyles.w500f16.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
