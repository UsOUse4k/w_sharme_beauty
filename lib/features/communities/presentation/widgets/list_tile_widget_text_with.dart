import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class ListTilleWidgetTextWith extends StatelessWidget {
  const ListTilleWidgetTextWith({
    super.key,
    this.title,
    required this.onPressed,
    required this.subTitle,
    required this.image,
  });

  final String? title;
  final Function() onPressed;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: title != null
          ? Text(
              title ?? '',
              style: AppStyles.w500f18.copyWith(color: AppColors.grey),
            )
          : null,
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: InkWell(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(image),
                  SizedBox(width: 14.w),
                  Text(
                    subTitle,
                    style: AppStyles.w400f16,
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
