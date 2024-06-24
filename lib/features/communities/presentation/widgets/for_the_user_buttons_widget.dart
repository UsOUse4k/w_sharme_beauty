import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';

class ForTheUserButtonsWidget extends StatefulWidget {
  const ForTheUserButtonsWidget(
      {super.key,
      required this.isSubscribe,
      required this.onPressedSubscribe,
      required this.onPressed,});

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
        Flexible(
          child: GlSubscribeButton(
            isSubscribe: widget.isSubscribe,
            height: 47.h,
            width: double.infinity,
          ),
        ),
        const Gap(10),
        Flexible(
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              height: 47.h,
              width: double.infinity,
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
        ),
      ],
    );
  }
}
