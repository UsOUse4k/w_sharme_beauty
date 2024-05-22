import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class FeedbackCardWidget extends StatelessWidget {
  const FeedbackCardWidget({
    super.key,
    required this.customText,
    required this.customTextcreatedAt,
    required this.commentOnTap,
    required this.likeOnTap,
    required this.customerName,
    required this.feedbacks,
  });
  final String customText;
  final String customTextcreatedAt;
  final Function() commentOnTap;
  final Function() likeOnTap;
  final String customerName;
  final String feedbacks;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: GlCircleAvatar(
            avatar: Assets.images.ella.path,
            width: 46.w,
            height: 46.h,
          ),
          title: Text(
            customerName,
            style: AppStyles.w500f18.copyWith(
              color: AppColors.purple,
            ),
          ),
          subtitle: Text(
            feedbacks,
            style: AppStyles.w400f16.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                color: AppColors.yellow,
                size: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customText,
                        style: AppStyles.w500f18,
                      ),
                      Text(
                        customTextcreatedAt,
                        style: AppStyles.w400f16
                            .copyWith(color: AppColors.darkGrey),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GlIconButton(
                    onPressed: commentOnTap,
                    icon: const Icon(
                      Icons.message_outlined,
                      color: AppColors.grey,
                      size: 20,
                    ),
                  ),
                  Text(
                    "1",
                    style: AppStyles.w400f16.copyWith(color: AppColors.grey),
                  ),
                  GlIconButton(
                    onPressed: likeOnTap,
                    icon: const Icon(
                      Icons.thumb_up,
                      color: AppColors.grey,
                      size: 20,
                    ),
                  ),
                  Text(
                    "1",
                    style: AppStyles.w400f16.copyWith(color: AppColors.grey),
                  ),
                  SizedBox(width: 5.w),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            width: 350.w,
            height: 128.h,
            decoration: const BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: GlCircleAvatar(
                    avatar: Assets.images.elena.path,
                    width: 46.w,
                    height: 46.h,
                  ),
                  title: Text(
                    "Зоосфера",
                    style: AppStyles.w500f18.copyWith(
                      color: AppColors.purple,
                    ),
                  ),
                  subtitle: Text(
                    "Официальный ответ",
                    style: AppStyles.w400f16.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                ),
                Text(
                  "Добрый день, Благодарим за отзыв.",
                  style: AppStyles.w500f18,
                ),
                Text(
                  "1 августа 2023",
                  style: AppStyles.w400f16.copyWith(color: AppColors.darkGrey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
