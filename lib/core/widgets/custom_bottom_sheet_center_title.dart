import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class CustomBottomSheetCenterTitle extends StatelessWidget {
  const CustomBottomSheetCenterTitle({
    super.key,
    required this.navbarTitle1,
    required this.navbarTitle2,
    required this.widget,
    this.maxHeight,
  });

  final String navbarTitle1;
  final String navbarTitle2;
  final Widget widget;
  final double? maxHeight;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: maxHeight ?? 0.4,
      maxChildSize: maxHeight ?? 0.4,
      expand: false,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.6,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      navbarTitle1,
                      style: AppStyles.w500f18.copyWith(
                        color: AppColors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.6,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      navbarTitle2,
                      style: AppStyles.w500f18.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: controller,
                  children: [
                    widget,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
