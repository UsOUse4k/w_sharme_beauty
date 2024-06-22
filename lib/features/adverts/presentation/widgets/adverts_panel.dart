import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_icon_button.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class AdvertsPanel extends StatelessWidget {
  const AdvertsPanel({
    super.key,
    this.onSearchTap,
  });

  final VoidCallback? onSearchTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(18),
          Text(
            'Объявления',
            style: AppStyles.w500f22,
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AdvertIconButton(
                text: 'Поиск',
                icon: const Icon(Icons.search),
                onTap: () {
                  onSearchTap?.call();
                },
              ),
              AdvertIconButton(
                text: 'Мои',
                icon: Assets.icons.ads.image(height: 24, width: 24),
                onTap: () {
                  context.push(
                    "/adverts/${RouterContants.advertMyAdvertsPage}",
                  );
                },
              ),
              AdvertIconButton(
                text: 'Создать',
                icon: const Icon(Icons.add_circle_outline),
                onTap: () {
                  context.push(
                    "/adverts/${RouterContants.advertCreateAdvertPage}",
                  );
                },
              ),
            ],
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
