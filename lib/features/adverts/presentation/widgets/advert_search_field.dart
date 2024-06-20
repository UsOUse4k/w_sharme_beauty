import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class AdvertSearchField extends StatelessWidget {
  const AdvertSearchField({
    super.key,
    this.onTap,
    required this.queryText,
  });

  final String queryText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        height: 47,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.svgs.search.path),
            const Gap(14),
            if (queryText.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    queryText,
                    maxLines: 1,
                    style: AppStyles.w400f16,
                  ),
                ),
              )
            else
              Text(
                "Поиск",
                style: AppStyles.w400f16.copyWith(
                  color: AppColors.darkGrey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
