import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class CustomContainerPaddingLeft extends StatelessWidget {
  const CustomContainerPaddingLeft({
    super.key,
    required this.child,
    this.marginTop,
    this.marginBottom,
    this.left,
  });
  final Widget child;
  final double? marginTop;
  final double? marginBottom;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: marginTop ?? 0, bottom: marginBottom ?? 0),
      padding: EdgeInsets.only(left: left ?? 18),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: child,
    );
  }
}
