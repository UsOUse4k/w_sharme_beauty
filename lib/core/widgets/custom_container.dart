import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.marginTop,
    this.marginBottom,
    this.vertical,
  });
  final Widget child;
  final double? marginTop;
  final double? marginBottom;
  final double? vertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: marginTop ?? 0, bottom: marginBottom ?? 0),
      padding: EdgeInsets.only(left: vertical ?? 18),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: child,
    );
  }
}
