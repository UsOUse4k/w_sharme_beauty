import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget({
    super.key,
    required this.wrapText,
    required this.onTap,
  });
  final String wrapText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            wrapText,
            style: AppStyles.w400f16.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
        ),
      ),
    );
  }
}
