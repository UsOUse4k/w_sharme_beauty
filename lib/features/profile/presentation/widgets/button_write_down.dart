import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class ButtomWriteDown extends StatelessWidget {
  const ButtomWriteDown({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 47.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.purple,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'Написать',
              style: AppStyles.w500f16.copyWith(color: AppColors.purple),
            ),
          ),
        ),
      ),
    );
  }
}
