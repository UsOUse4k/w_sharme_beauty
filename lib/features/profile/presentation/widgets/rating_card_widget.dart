import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class RatingCardWidget extends StatelessWidget {
  const RatingCardWidget({
    super.key, required this.rating,
  });

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: AppColors.yellow,
        ),
        SizedBox(width: 4.w),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: rating,
                style: AppStyles.w500f18,
              ),
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(0, 5),
                  child: Text(
                    ' / 10',
                    style:
                        AppStyles.w500f18.copyWith(
                      color: AppColors.darkGrey,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
