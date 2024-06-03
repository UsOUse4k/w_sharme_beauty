import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.width,
    required this.height,
    this.avatar,
    this.onPressed,
    this.raduis = 20,
  });
  final double? raduis;
  final double width;
  final double height;
  final String? avatar;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (avatar != null && avatar != null && avatar != '')
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(raduis!),
              ),
              child: GlCachedNetworImage(
                height: height.h,
                width: width.w,
                urlImage: avatar,
              ),
            )
          else
            GlCircleAvatar(
              avatar: Assets.images.notAvatar.path,
              width: height.w,
              height: width.w,
            ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
