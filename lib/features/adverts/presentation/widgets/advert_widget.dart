import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/time.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_edit_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/distance_widget.dart';
import 'package:w_sharme_beauty/gen/fonts.gen.dart';

class AdvertWidget extends StatelessWidget {
  const AdvertWidget({
    super.key,
    required this.images,
    required this.name,
    required this.description,
    required this.address,
    required this.rating,
    required this.reviewsCount,
    required this.schedule,
    this.onTap,
    this.onEditTap,
    required this.coordinates,
  });

  final List<String> images;
  final String name;
  final String description;
  final String address;
  final double rating;
  final int reviewsCount;
  final List<Time> schedule;
  final (double, double) coordinates;
  final VoidCallback? onTap;
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(color: AppColors.lightGrey),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppStyles.w500f16,
                      ),
                      const Spacer(),
                      if (onEditTap != null)
                        AdvertEditButton(
                          onTap: () {
                            onEditTap?.call();
                          },
                        ),
                    ],
                  ),
                  Text(
                    description,
                    style: AppStyles.w400f14.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const Gap(6),
                  Text(
                    address,
                    style: AppStyles.w400f14.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const Gap(6),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 22,
                        color: AppColors.yellow,
                      ),
                      const Gap(6),
                      Text(
                        rating.toString(),
                        style: AppStyles.w500f14,
                      ),
                      const Gap(2),
                      const Text(
                        " /5",
                        style: TextStyle(
                          fontFamily: FontFamily.gTEastiProDisplay,
                          fontSize: 10,
                          color: AppColors.darkGrey,
                        ),
                      ),
                      const Gap(2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          '($reviewsCount)',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.darkGrey,
                          ),
                          // style: AppStyles.w400f14.copyWith(
                          //   color: AppColors.darkGrey,
                          // ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(10),
            SizedBox(
              height: 80,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: images[index],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Gap(6),
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    getTime(schedule),
                    style: AppStyles.w400f14.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const Spacer(),
                  DistanceWidget(destination: coordinates),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
