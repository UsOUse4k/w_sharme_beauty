import 'dart:typed_data';

import 'package:video_thumbnail/video_thumbnail.dart';

Future<Uint8List?> generateThumbnail(String videoUrl) async {
  try {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: videoUrl,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,  // Установите ширину миниатюры
      quality: 25,    // Установите качество миниатюры
    );
    return uint8list;
  } catch (e) {
    return null;
  }
}
