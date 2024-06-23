import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class GlCircleAvatar extends StatelessWidget {
  const GlCircleAvatar({
    super.key,
    required this.avatar,
    required this.width,
    required this.height,
  });

  final String avatar;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return avatar != ''
        ? ClipRRect(
            borderRadius:  BorderRadius.all(
              Radius.circular(width.w / 2),
            ),
            child: GlCachedNetworImage(
              height: height.h,
              width: width.w,
              urlImage: avatar,
            ),
          )
        : Container(
            width: width.w,
            height: height.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(Assets.images.notAvatar.path),
                fit: BoxFit.cover,
              ),
            ),
          );
  }
}
