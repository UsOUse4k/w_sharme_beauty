import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/gen/fonts.gen.dart';

class AdvertDetailsTabBar extends StatelessWidget {
  const AdvertDetailsTabBar({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final labels = [
      "Обзор",
      "Товары и услуги",
      "Фото",
      "Отзывы",
    ];

    return TabBar(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      labelPadding: const EdgeInsets.only(right: 50),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
      labelColor: AppColors.purple,
      labelStyle: TextStyle(
        fontFamily: FontFamily.gTEastiProDisplay,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      indicator: const ShapeDecoration(
        shape: UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: AppColors.purple,
            width: 2,
          ),
        ),
      ),
      tabs: labels
          .map(
            (label) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(label),
            ),
          )
          .toList(),
    );
  }
}
