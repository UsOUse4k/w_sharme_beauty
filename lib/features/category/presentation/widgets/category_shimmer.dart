import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class CategoryShimmer extends StatelessWidget {
const CategoryShimmer({ super.key });

  @override
  Widget build(BuildContext context){
    return Shimmer.fromColors(
      baseColor: AppColors.lightGrey,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 55,
              height: 77,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}