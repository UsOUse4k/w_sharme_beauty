import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts/adverts_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_categories_widget.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_filters_widget.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class AdvertsSearchPanel extends StatefulWidget {
  const AdvertsSearchPanel({
    super.key,
    this.onCloseTap,
    required this.queryText,
  });

  final String queryText;
  final VoidCallback? onCloseTap;

  @override
  State<AdvertsSearchPanel> createState() => _AdvertsSearchPanelState();
}

class _AdvertsSearchPanelState extends State<AdvertsSearchPanel> {
  @override
  void initState() {
    super.initState();
    context.read<AdvertsCubit>().getAdverts(queryText: widget.queryText);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
          const Gap(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Text(
                  "Результаты поиска",
                  style: AppStyles.w700f18,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    widget.onCloseTap?.call();
                  },
                  child: Assets.svgs.close.svg(),
                ),
              ],
            ),
          ),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              'Категории',
              style: AppStyles.w500f18.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
          ),
          const Gap(10),
          const CategoriesWidget(),
          const Gap(15),
          const FiltersWidget(),
          const Gap(15),
          Expanded(
            child: BlocListener<AdvertsFilterCubit, AdvertsFilterState>(
              listener: (context, state) {
                context.read<AdvertsCubit>().filterAdvertsList(state);
              },
              child: BlocBuilder<AdvertsCubit, AdvertsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loadSuccess: (state) {
                      final adverts = state.adverts;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: adverts.length,
                        itemBuilder: (context, index) {
                          final advert = adverts[index];

                          return AdvertWidget(
                            images: advert.images,
                            name: advert.name,
                            description: advert.description,
                            address: advert.location.formattedAddress,
                            rating: advert.rating,
                            reviewsCount: advert.reviewsCount,
                            schedule: advert.schedule,
                            coordinates: advert.location.coordinates,
                            onTap: () {
                              context.push(
                                "/adverts/${RouterContants.advertDetailPage}",
                                extra: advert,
                              );
                            },
                          );
                        },
                      );
                    },
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
