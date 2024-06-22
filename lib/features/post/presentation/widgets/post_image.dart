import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/image_interactive_viewer.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    this.imageUrls,
  });

  final List<String>? imageUrls;

  @override
  Widget build(BuildContext context) {
    return imageUrls!.length == 1
        ? ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: ImageInteractiveViewer(
              child: GlCachedNetworImage(
                height: 394.h,
                width: double.infinity,
                urlImage: imageUrls![0],
              ),
            ),
          )
        : SizedBox(
            height: 240.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: List.generate(
                  imageUrls!.length,
                  (index) {
                    return GlCachedNetworImage(
                      urlImage: imageUrls![index],
                    );
                  },
                ),
              ),
            ),
          );
  }
}
