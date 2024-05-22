import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/star_marcs_widget.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/widgets.dart';

class FeedbacksWidget extends StatelessWidget {
  const FeedbacksWidget({
    super.key,
    required this.title,
    required this.marks,
    required this.rating,
  });

  final String title;
  final String marks;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaddingHorizontalWidget(
          child: Text(
            title,
            style: AppStyles.w500f18.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            width: 394.w,
            height: 193.h,
            color: AppColors.lightGrey,
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    rating,
                    style: AppStyles.w500f38,
                  ),
                  title: const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.purple,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.purple,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.purple,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.purple,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.purple,
                        size: 20,
                      ),
                    ],
                  ),
                  subtitle: Text(
                    marks,
                    style: AppStyles.w500f18,
                  ),
                ),
                const StarMarcsWidget(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
