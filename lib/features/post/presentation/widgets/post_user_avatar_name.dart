import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';

class PostUserAvatarName extends StatelessWidget {
  const PostUserAvatarName({
    super.key,
    required this.username,
    required this.avatar,
    this.width,
    this.height,
    this.style,
  });
  final String username;
  final String avatar;
  final double? width;
  final double? height;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlCircleAvatar(
          avatar: avatar,
          width: width ?? 50.w,
          height: height ?? 50.h,
        ),
        const Gap(10),
        Text(username, style: style ?? AppStyles.w500f18),
      ],
    );
  }
}
