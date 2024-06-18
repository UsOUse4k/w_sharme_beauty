import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ReplyWidget extends StatelessWidget {
  const ReplyWidget({
    super.key,
    required this.userProfileImage,
    required this.userFullName,
    required this.comment,
    required this.createdAt,
  });

  final String? userProfileImage;
  final String userFullName;
  final String comment;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (userProfileImage != null)
                CircleAvatar(
                  radius: 21,
                  backgroundImage:
                      CachedNetworkImageProvider(userProfileImage!),
                )
              else
                CircleAvatar(
                  radius: 21,
                  backgroundImage: AssetImage(Assets.images.notAvatar.path),
                ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userFullName,
                    style: AppStyles.w500f14.copyWith(
                      color: AppColors.purple,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    "Официальный ответ",
                    style: AppStyles.w400f12.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Gap(10),
          Row(
            children: [
              Text(
                comment,
                style: AppStyles.w400f14,
              ),
            ],
          ),
          const Gap(6),
          Row(
            children: [
              Text(
                DateFormat('d MMMM y', "ru").format(createdAt),
                style: AppStyles.w400f12.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
