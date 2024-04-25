import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CardBlocAdvertsWidget extends StatelessWidget {
  const CardBlocAdvertsWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.rating,
  });

  final String title;
  final String desc;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.w500f16,
                ),
                Text(
                  desc,
                  style: AppStyles.w400f14.copyWith(color: AppColors.grey),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.yellow),
                    Text(
                      rating,
                      style: AppStyles.w500f14,
                    ),
                    Text(
                      ' /5 ',
                      style: AppStyles.w400f13
                          .copyWith(fontSize: 10, color: AppColors.grey),
                    ),
                    Text(
                      '(345)',
                      style: AppStyles.w400f14.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: SizedBox(
              height: 85,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Assets.images.bloc.image(
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(width: 6),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Работаю до 22:00',
                  style: AppStyles.w400f14,
                ),
                Text(
                  '2 км.',
                  style: AppStyles.w400f14.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
