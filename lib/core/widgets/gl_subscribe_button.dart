import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class GlSubscribeButton extends StatelessWidget {
  const GlSubscribeButton({
    super.key,
    required this.isSubscribe,
    this.onPressed, this.height, this.width,
  });
  final bool isSubscribe;
  final Function()? onPressed;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 32.h,
        width: width ?? 112.w,
        decoration: BoxDecoration(
          color: isSubscribe ? Colors.white : AppColors.purple,
          borderRadius: BorderRadius.circular(10),
          border: isSubscribe ? Border.all(color: AppColors.grey) : null,
        ),
        child: Center(
          child: Text(
            isSubscribe ? 'Вы подписаны' : 'Подписаться',
            style: AppStyles.w400f16.copyWith(
              color: isSubscribe ? AppColors.grey : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
