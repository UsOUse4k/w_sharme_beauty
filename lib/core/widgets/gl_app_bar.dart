import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class GlAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlAppBar({
    super.key,
    this.title,
    this.leading,
    this.action,
  });

  final Widget? title;
  final Widget? leading;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18).copyWith(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Stack(
        children: [
          if (leading != null)
            Align(
              alignment: Alignment.centerLeft,
              child: leading,
            ),
          if (title != null)
            Center(
              child: title,
            ),
          if (action != null)
            Align(
              alignment: Alignment.centerRight,
              child: action,
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
