import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/create_review/create_review_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/replies/replies_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/reviews/reviews_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_refresh_indicator.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_text_form_field.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_warning_text.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/review_widget.dart';
import 'package:w_sharme_beauty/gen/fonts.gen.dart';

class AdvertReviewsPage extends StatelessWidget {
  const AdvertReviewsPage({
    super.key,
    required this.advertId,
    required this.rating,
    required this.reviewsCount,
  });

  final String advertId;
  final double rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return AdvertRefreshIndicator(
      onRefresh: () => context.read<ReviewsCubit>().getReviews(advertId),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          padding: const EdgeInsets.all(18),
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Отзывы",
                style: AppStyles.w500f18,
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.lightGrey,
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            fontFamily: FontFamily.gTEastiProDisplay,
                            fontSize: 40.sp,
                            color: AppColors.black,
                          ),
                        ),
                        const Gap(12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ...List.generate(
                                  rating.toInt(),
                                  (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColors.purple,
                                      size: 20,
                                    );
                                  },
                                ),
                                ...List.generate(
                                  5 - rating.toInt(),
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
                            Text(
                              "$reviewsCount оценки",
                              style: AppStyles.w400f14,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(36),
                    Column(
                      children: [
                        Text(
                          "Были здесь? Напишите отзыв",
                          style: AppStyles.w400f14.copyWith(
                            color: AppColors.darkGrey,
                          ),
                        ),
                        const Gap(15),
                        GestureDetector(
                          onTap: () {
                            showAdvertModalBottomSheet<Review>(
                              context: context,
                              builder: (context) {
                                return BlocProvider(
                                  create: (context) =>
                                      getIt<CreateReviewCubit>(),
                                  child: AddReviewModalBottomSheet(
                                    advertId: advertId,
                                  ),
                                );
                              },
                            ).then(
                              (value) {
                                if (value != null) {
                                  context.read<ReviewsCubit>().addReview(value);
                                }
                              },
                            );
                          },
                          child: SizedBox(
                            width: 260,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(
                                  5,
                                  (index) {
                                    return const Icon(
                                      Icons.star,
                                      color: AppColors.darkGrey,
                                      size: 40,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<ReviewsCubit, ReviewsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loadSuccess: (state) {
                      final reviews = state.reviews;

                      if (reviews.isNotEmpty) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final review = reviews[index];

                              return Column(
                                children: [
                                  BlocProvider(
                                    create: (context) => getIt<RepliesCubit>()
                                      ..getReplies(advertId, review.id),
                                    child: ReviewWidget(
                                      userProfileImage: review.userProfileImage,
                                      userFullName: review.userFullName,
                                      userReviewsCount: review.userReviewsCount,
                                      rating: review.rating,
                                      comment: review.comment,
                                      likes: review.likes,
                                      repliesCount: review.repliesCount,
                                      createdAt: review.createdAt,
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Gap(20);
                            },
                            itemCount: reviews.length,
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
            ],
          ),
        ),
      ),
    );
  }
}

class AddReviewModalBottomSheet extends StatelessWidget {
  const AddReviewModalBottomSheet({
    super.key,
    required this.advertId,
  });

  final String advertId;

  @override
  Widget build(BuildContext context) {
    return AdvertModalBottomSheet(
      title: "Оставьте отзыв",
      child: BlocConsumer<CreateReviewCubit, CreateReviewState>(
        listener: (context, state) {
          state.advertFailureOrReviewOption.fold(
            () {},
            (either) {
              either.fold(
                (l) {
                },
                (review) {
                  Navigator.pop(context, review);
                },
              );
            },
          );
        },
        builder: (context, state) {
          return Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              children: [
                Column(
                  children: [
                    const Gap(18),
                    Text(
                      "Были здесь? Напишите отзыв",
                      style: AppStyles.w400f14.copyWith(
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const Gap(15),
                    SizedBox(
                      width: 260,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...List.generate(
                            5,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<CreateReviewCubit>()
                                      .ratingChanged(index + 1);
                                },
                                child: Icon(
                                  Icons.star,
                                  color: state.rating != null
                                      ? index <= state.rating! - 1
                                          ? AppColors.yellow
                                          : AppColors.darkGrey
                                      : AppColors.darkGrey,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    if (state.showErrorMessages && state.rating == null)
                      const AdvertWarningText(
                        message: "Поставьте оценку",
                      ),
                  ],
                ),
                const Gap(18),
                Row(
                  children: [
                    Text(
                      'Комментарий',
                      style: AppStyles.w400f16,
                    ),
                  ],
                ),
                const Gap(8),
                AdvertTextFormField(
                  hintText: "Оставьте комментарий...",
                  maxLines: 5,
                  onChanged: (value) {
                    context.read<CreateReviewCubit>().commentChanged(value);
                  },
                  validator: (value) {
                    if (value != null) {
                      if (value.isEmpty) {
                        return "Обязательное поле";
                      }
                    }

                    return null;
                  },
                ),
                const Gap(20),
                GlButton(
                  text: state.isSubmitting ? "Загрузка" : 'Готово',
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    context.read<CreateReviewCubit>().createReview(advertId);
                  },
                ),
                const Gap(20),
                Gap(MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          );
        },
      ),
    );
  }
}
