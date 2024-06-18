import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AdverImagesPage extends StatelessWidget {
  const AdverImagesPage({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: images.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      itemBuilder: (context, index) {
        return CachedNetworkImage(
          imageUrl: images[index],
        );
      },
    );
  }
}
