import 'package:flutter/material.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class ServicesListWidget extends StatelessWidget {
  final String text;
  final Function() removeOnPress;
  final Function()? moreOnPress;
  const ServicesListWidget({
    super.key,
    required this.text,
    required this.removeOnPress,
    this.moreOnPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGrey,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              text,
              style: AppStyles.w400f14,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    onTap: removeOnPress,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(9),
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
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: moreOnPress,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
