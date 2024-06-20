import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/search_adverts/search_adverts_cubit.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class AdvertsSearchModalBottomSheet extends StatefulWidget {
  const AdvertsSearchModalBottomSheet({super.key});

  @override
  State<AdvertsSearchModalBottomSheet> createState() =>
      _AdvertsSearchModalBottomSheetState();
}

class _AdvertsSearchModalBottomSheetState
    extends State<AdvertsSearchModalBottomSheet> {
  late final TextEditingController queryController;
  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    queryController = TextEditingController();
    focusNode = FocusNode();

    context.read<SearchAdvertsCubit>().getAdverts();
  }

  @override
  void dispose() {
    queryController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: AppColors.bgColors,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            ColoredBox(
              color: AppColors.white,
              child: Column(
                children: [
                  const Gap(6),
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const Gap(14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Container(
                      height: 47,
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(Assets.svgs.arrowBack.path),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Gap(2),
                          Flexible(
                            child: TextField(
                              controller: queryController,
                              focusNode: focusNode,
                              textInputAction: TextInputAction.search,
                              onChanged: (value) {
                                context
                                    .read<SearchAdvertsCubit>()
                                    .searchAdvert(value);
                              },
                              onSubmitted: (value) {
                                Navigator.pop(context, queryController.text);
                              },
                              style: AppStyles.w400f16,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Поиск",
                                hintStyle: AppStyles.w400f16.copyWith(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ),
                          ),
                          const Gap(14),
                          GestureDetector(
                            onTap: () {
                              queryController.clear();
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.close,
                                size: 16,
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
            SizedBox(
              height: 600,
              child: BlocBuilder<SearchAdvertsCubit, SearchAdvertsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loadSuccess: (state) {
                      final adverts = state.adverts;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: adverts.length,
                        itemBuilder: (context, index) {
                          final advert = adverts[index];

                          return ResultWidget(
                            title: advert.name,
                            subtitle: advert.location.formattedAddress,
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
          ],
        ),
      ),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.white,
      child: Material(
        child: InkWell(
          onTap: () {
            onTap?.call();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                if (subtitle != null)
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGrey,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.location_on,
                      size: 18,
                      color: AppColors.darkGrey,
                    ),
                  )
                else
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE77331).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.search,
                      size: 18,
                      color: Color(0xFFE77331),
                    ),
                  ),
                const Gap(11),
                Expanded(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.w500f16,
                          ),
                        ),
                        if (subtitle != null)
                          Flexible(
                            child: Text(
                              subtitle!,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.w400f12.copyWith(
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
