import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class AdvertFieldButton extends StatelessWidget {
  const AdvertFieldButton({
    super.key,
    required this.text,
    this.onTap,
    this.onRemoveTap,
  });

  final String text;
  final VoidCallback? onTap;
  final VoidCallback? onRemoveTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.w500f16,
              ),
            ),
            Row(
              children: [
                if (onRemoveTap != null) ...[
                  GestureDetector(
                    onTap: onRemoveTap,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          size: 15,
                          Icons.close_rounded,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
                SvgPicture.asset(Assets.svgs.arrowForward.path),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
