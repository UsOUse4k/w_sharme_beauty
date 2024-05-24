import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';

class ListTileCheckbox extends StatelessWidget {
  const ListTileCheckbox({
    super.key,
    required this.subtitle,
    required this.title,
    this.isChecked,
    required this.onChanged,
  });
  final String subtitle;
  final String title;
  final bool? isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: RoundCheckbox(
        isChecked: isChecked,
        onChanged: onChanged,
      ),
      title: Text(
        title,
        style: AppStyles.w500f18,
      ),
      subtitle: Text(
        subtitle,
        style: AppStyles.w400f14.copyWith(color: AppColors.darkGrey),
      ),
    );
  }
}
