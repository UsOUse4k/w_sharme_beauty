// ignore_for_file: use_named_constants

import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class TabBarWidget extends StatelessWidget  {
  const TabBarWidget({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TabBar(
      labelPadding:  const EdgeInsets.all(0.0),
      controller: tabController,
      labelStyle: AppStyles.w400f16,
      labelColor: AppColors.white,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: AppColors.grey,
      dividerColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      tabs: List.generate(2, (index) {
        return AnimatedBuilder(
          animation: tabController,
          builder: (context, child) {
            return Container(
              margin:  EdgeInsets.only(right: index == 0 ? 10 : 0),
              height: 40,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                color: tabController.index == index ? AppColors.purple : AppColors.lightGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  index == 0 ? 'Чат' : 'Чат сообществ',
                  style: AppStyles.w400f16.copyWith(
                    color: tabController.index == index ? AppColors.white : AppColors.grey,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
