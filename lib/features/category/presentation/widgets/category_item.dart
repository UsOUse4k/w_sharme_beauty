import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.imageUrl, required this.title, this.onPressed, required this.color,});
  final String imageUrl;
  final String title;
  final Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          GlCachedNetworImage(
            width: 57.w,
            height: 57.w,
            urlImage: imageUrl,
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: AppStyles.w400f13.copyWith(fontSize: 12.sp, color: color),
          ),
        ],
      ),
    );
  }
}
