import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_app_bar.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/create_reply/create_reply_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/replies/replies_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/reviews/reviews_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_back_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_refresh_indicator.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_text_form_field.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/review_widget.dart';
import 'package:w_sharme_beauty/gen/fonts.gen.dart';

class AdvertReplyReviewsPage extends StatelessWidget {
  const AdvertReplyReviewsPage({
    super.key,
    required this.advert,
  });

  final Advert advert;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bgColors,
      appBar: GlAppBar(
        leading: AdvertBackButton(
          onTap: () {
            context.pop();
          },
        ),
        title: Text(
          "Отзывы",
          style: AppStyles.w500f18,
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<ReviewsCubit>()..getReviews(advert.id),
        child: _AdvertReplyReviewBody(
          advert: advert,
        ),
      ),
    );
  }
}

class _AdvertReplyReviewBody extends StatelessWidget {
  const _AdvertReplyReviewBody({
    required this.advert,
  });

  final Advert advert;

  @override
  Widget build(BuildContext context) {
    return AdvertRefreshIndicator(
      onRefresh: () => context.read<ReviewsCubit>().getReviews(advert.id),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          Container(
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
                            advert.rating.toString(),
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
                                    advert.rating.toInt(),
                                    (index) {
                                      return const Icon(
                                        Icons.star,
                                        color: AppColors.purple,
                                        size: 20,
                                      );
                                    },
                                  ),
                                  ...List.generate(
                                    5 - advert.rating.toInt(),
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
                                "${advert.reviewsCount} оценки",
                                style: AppStyles.w400f14,
                              ),
                            ],
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
                                        ..getReplies(advert.id, review.id),
                                      child: ReviewWidget(
                                        userProfileImage:
                                            review.userProfileImage,
                                        userFullName: review.userFullName,
                                        userReviewsCount:
                                            review.userReviewsCount,
                                        rating: review.rating,
                                        comment: review.comment,
                                        likes: review.likes,
                                        repliesCount: review.repliesCount,
                                        createdAt: review.createdAt,
                                      ),
                                    ),
                                    const Gap(6),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            showAdvertModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return BlocProvider(
                                                  create: (context) =>
                                                      getIt<CreateReplyCubit>(),
                                                  child:
                                                      AddReplyModalBottomSheet(
                                                    advertId: advert.id,
                                                    reviewId: review.id,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            "Ответить",
                                            style: AppStyles.w400f14.copyWith(
                                              color: AppColors.purple,
                                            ),
                                          ),
                                        ),
                                      ],
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
        ],
      ),
    );
  }
}

class AddReplyModalBottomSheet extends StatelessWidget {
  const AddReplyModalBottomSheet({
    super.key,
    required this.reviewId,
    required this.advertId,
  });

  final String reviewId;
  final String advertId;

  @override
  Widget build(BuildContext context) {
    return AdvertModalBottomSheet(
      title: "Ваш ответ",
      child: BlocConsumer<CreateReplyCubit, CreateReplyState>(
        listener: (context, state) {
          state.advertFailureOrReplyOption.fold(
            () {},
            (either) {
              either.fold(
                (l) {
                  print(l);
                },
                (reply) {
                  Navigator.pop(context, reply);
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
                AdvertTextFormField(
                  hintText: "Оставьте ответ...",
                  onChanged: (value) {
                    context.read<CreateReplyCubit>().commentChanged(value);
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

                    context
                        .read<CreateReplyCubit>()
                        .createReply(advertId, reviewId);
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
