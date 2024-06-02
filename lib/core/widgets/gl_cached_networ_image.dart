import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class GlCachedNetworImage extends StatelessWidget {
  const GlCachedNetworImage({
    super.key,
    this.urlImage,
    this.height,
    this.width,
  });

  final String? urlImage;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: urlImage.toString(),
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: AppColors.lightGrey,
      ),
      errorWidget: (context, url, error) => Container(
        decoration: const BoxDecoration(
          color: AppColors.lightGrey,
          shape: BoxShape.circle,
        ),
        child: Image.asset('assets/images/notAvatar.png', fit: BoxFit.cover),
        //  const Icon(
        //   Icons.image,
        //   color: Colors.red,
        //   size: 80,
        // ),
      ),
    );
  }
}
