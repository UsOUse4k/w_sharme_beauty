import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

import 'package:w_sharme_beauty/features/adverts/presentation/widgets/time_widget.dart';

class ScheduleCardWidget extends StatelessWidget {
  const ScheduleCardWidget({
    super.key,
    required this.timeText1,
    required this.timeText2,
    required this.weekDay,
    required this.onTap,
  });
  final String weekDay;
  final String timeText1;
  final String timeText2;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          weekDay,
          style: AppStyles.w500f18.copyWith(color: AppColors.darkGrey),
        ),
        Row(
          children: [
            TimeWidget(
              wrapText: timeText1,
            ),
            const SizedBox(width: 10),
            const Text("-"),
            const SizedBox(width: 10),
            TimeWidget(
              wrapText: timeText2,
            ),
          ],
        ),
      ],
    );
  }
}
