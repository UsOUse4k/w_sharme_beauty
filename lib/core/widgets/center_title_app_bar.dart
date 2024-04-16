import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class CenterTitleAppBar extends StatelessWidget {
  const CenterTitleAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.w500f18,
    );
  }
}
