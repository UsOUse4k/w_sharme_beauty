import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class CardImageProfileAdd extends StatelessWidget {
  const CardImageProfileAdd({
    super.key,
    required this.image,
    required this.onPressed,
    this.radius,
    this.width,
    this.height,
  });

  final ImageProvider image;
  final Function() onPressed;
  final double? radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100.w,
      height: height ?? 100.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 10),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 5,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: const Center(
                  child: Icon(
                    size: 15,
                    Icons.remove,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
