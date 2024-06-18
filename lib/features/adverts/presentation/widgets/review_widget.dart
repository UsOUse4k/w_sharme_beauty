import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/replies/replies_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/reply_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.userProfileImage,
    required this.userFullName,
    required this.userReviewsCount,
    required this.rating,
    required this.comment,
    required this.likes,
    required this.repliesCount,
    required this.createdAt,
  });

  final String? userProfileImage;
  final String userFullName;
  final int userReviewsCount;
  final int rating;
  final String comment;
  final int likes;
  final int repliesCount;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userProfileImage != null)
              CircleAvatar(
                radius: 21,
                backgroundImage: CachedNetworkImageProvider(userProfileImage!),
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
                  "$userReviewsCount отзывов",
                  style: AppStyles.w400f12.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                ...List.generate(
                  rating,
                  (index) {
                    return const Icon(
                      Icons.star,
                      color: AppColors.yellow,
                      size: 20,
                    );
                  },
                ),
                ...List.generate(
                  5 - rating,
                  (index) {
                    return const Icon(
                      Icons.star,
                      color: AppColors.darkGrey,
                      size: 20,
                    );
                  },
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
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.message_outlined,
                  color: AppColors.darkGrey,
                  size: 20,
                ),
                const Gap(4),
                Text(
                  repliesCount.toString(),
                  style: AppStyles.w400f12.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
                const Gap(10),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.thumb_up_outlined,
                    color: AppColors.darkGrey,
                    size: 20,
                  ),
                ),
                const Gap(4),
                Text(
                  likes.toString(),
                  style: AppStyles.w400f12.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 44),
          child: BlocBuilder<RepliesCubit, RepliesState>(
            builder: (context, state) {
              return state.maybeMap(
                loadSuccess: (state) {
                  final replies = state.replies;

                  if (replies.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: replies.length,
                        itemBuilder: (context, index) {
                          final reply = replies[index];

                          return ReplyWidget(
                            userProfileImage: reply.userProfileImage,
                            userFullName: reply.userFullName,
                            comment: reply.comment,
                            createdAt: reply.createdAt,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Gap(10);
                        },
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
                orElse: () {
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
