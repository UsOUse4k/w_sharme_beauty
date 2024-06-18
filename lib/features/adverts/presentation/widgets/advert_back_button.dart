import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class AdvertBackButton extends StatelessWidget {
  const AdvertBackButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(Assets.svgs.arrowBack.path),
      onPressed: () {
        onTap?.call();
      },
    );
  }
}
