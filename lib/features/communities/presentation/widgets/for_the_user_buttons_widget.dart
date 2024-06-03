import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class ForTheUserButtonsWidget extends StatefulWidget {
  const ForTheUserButtonsWidget({super.key, required this.isSubscribe, required this.onPressedSubscribe, required this.onPressed});

  final bool isSubscribe;
  final Function() onPressedSubscribe;
  final Function() onPressed;


  @override
  _ForTheUserButtonsWidgetState createState() =>
      _ForTheUserButtonsWidgetState();
}

class _ForTheUserButtonsWidgetState extends State<ForTheUserButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: widget.onPressedSubscribe,
          child: Container(
            height: 47.h,
            width: 172.w,
            decoration: BoxDecoration(
              color: widget.isSubscribe ? Colors.white : AppColors.purple,
              borderRadius: BorderRadius.circular(10),
              border: widget.isSubscribe ? Border.all(color: AppColors.grey) : null,
            ),
            child: Center(
              child: Text(
                widget.isSubscribe ? 'Вы подписаны' : 'Подписаться',
                style: AppStyles.w400f16.copyWith(
                  color: widget.isSubscribe ? AppColors.grey : Colors.white,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            height: 47.h,
            width: 172.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.purple),
            ),
            child: Center(
              child: Text(
                'Перейти в чат',
                style: AppStyles.w400f16.copyWith(
                  color: AppColors.purple,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
