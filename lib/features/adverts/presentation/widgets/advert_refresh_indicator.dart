import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class AdvertRefreshIndicator extends StatelessWidget {
  const AdvertRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: AppColors.white,
      color: AppColors.purple,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
