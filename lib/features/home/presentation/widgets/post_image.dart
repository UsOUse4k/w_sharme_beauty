import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: Image(
              height: 394.h,
              fit: BoxFit.cover,
              image: AssetImage(
                imageUrls![0],
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
                    // Генерируем 6 виджетов для сетки
                    return Image(
                      fit: BoxFit.cover,
                      image: AssetImage(imageUrls![index]),
                    );
                  },
                ),
              ),
            ),
          );
  }
}
