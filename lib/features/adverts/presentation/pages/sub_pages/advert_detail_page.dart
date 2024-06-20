import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/reviews/reviews_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_images_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_info_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_reviews_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/pages/sub_pages/advert_service_page.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/time.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_details_tab_bar.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/distance_widget.dart';

class AdverDetailPage extends StatefulWidget {
  const AdverDetailPage({
    super.key,
    required this.advert,
  });

  final Advert advert;

  @override
  State<AdverDetailPage> createState() => _AdverDetailPageState();
}

class _AdverDetailPageState extends State<AdverDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 280,
            child: CachedNetworkImage(
              imageUrl: widget.advert.images[0],
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: AppColors.bgColors,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ColoredBox(
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.advert.name,
                                style: AppStyles.w500f18,
                              ),
                              const Gap(6),
                              Text(
                                widget.advert.description,
                                style: AppStyles.w400f16.copyWith(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              const Gap(6),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.yellow,
                                  ),
                                  const Gap(6),
                                  Text(
                                    widget.advert.rating.toString(),
                                    style: AppStyles.w500f16,
                                  ),
                                  const Gap(2),
                                  Text(
                                    ' /5 ',
                                    style: AppStyles.w400f12.copyWith(
                                      color: AppColors.darkGrey,
                                    ),
                                  ),
                                  const Gap(2),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
                                    child: Text(
                                      '(${widget.advert.reviewsCount})',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  Text(
                                    getTime(widget.advert.schedule),
                                    style: AppStyles.w400f16,
                                  ),
                                  const Spacer(),
                                  DistanceWidget(
                                    destination:
                                        widget.advert.location.coordinates,
                                  ),
                                ],
                              ),
                              const Gap(15),
                              Row(
                                children: [
                                  Flexible(
                                    child: GlButton(
                                      style: AppStyles.w400f14.copyWith(
                                        color: AppColors.white,
                                      ),
                                      height: 40,
                                      text: 'Написать',
                                      onPressed: () {
                                        context.push(
                                          '/home/chat/${RouterContants.chatMessages}/${widget.advert.userId}',
                                        );
                                      },
                                    ),
                                  ),
                                  const Gap(10),
                                  Flexible(
                                    child: GlOutlineButton(
                                      title: 'Продолжить маршрут',
                                      onPressed: () {
                                        context.push(
                                          "/adverts/${RouterContants.advertRoutePage}",
                                          extra: widget.advert,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Gap(15),
                        AdvertDetailsTabBar(
                          controller: controller,
                        ),
                        const Gap(10),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        AdverInfoPage(
                          address: widget.advert.location.formattedAddress,
                          phoneNumber: widget.advert.phoneNumber,
                        ),
                        AdverServicePage(
                          services: widget.advert.services,
                        ),
                        AdverImagesPage(
                          images: widget.advert.images,
                        ),
                        BlocProvider(
                          create: (context) => getIt<ReviewsCubit>()
                            ..getReviews(widget.advert.id),
                          child: AdvertReviewsPage(
                            advertId: widget.advert.id,
                            rating: widget.advert.rating,
                            reviewsCount: widget.advert.reviewsCount,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
