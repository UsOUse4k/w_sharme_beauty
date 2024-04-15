/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/.gitkeep
  String get gitkeep => 'assets/icons/.gitkeep';

  /// File path: assets/icons/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/icons/heart.png');

  /// List of all assets
  List<dynamic> get values => [gitkeep, heart];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesProfileGen get profile => const $AssetsImagesProfileGen();
}

class $AssetsImagesProfileGen {
  const $AssetsImagesProfileGen();

  /// File path: assets/images/profile/ava.png
  AssetGenImage get ava => const AssetGenImage('assets/images/profile/ava.png');

  /// File path: assets/images/profile/avatar.png
  AssetGenImage get avatar =>
      const AssetGenImage('assets/images/profile/avatar.png');

  /// File path: assets/images/profile/bell.png
  AssetGenImage get bell =>
      const AssetGenImage('assets/images/profile/bell.png');

  /// File path: assets/images/profile/brovi.png
  AssetGenImage get brovi =>
      const AssetGenImage('assets/images/profile/brovi.png');

  /// File path: assets/images/profile/comments.png
  AssetGenImage get comments =>
      const AssetGenImage('assets/images/profile/comments.png');

  /// File path: assets/images/profile/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/images/profile/location.png');

  /// File path: assets/images/profile/main_picture.png
  AssetGenImage get mainPicture =>
      const AssetGenImage('assets/images/profile/main_picture.png');

  /// File path: assets/images/profile/manikur.png
  AssetGenImage get manikur =>
      const AssetGenImage('assets/images/profile/manikur.png');

  /// File path: assets/images/profile/pedikur.png
  AssetGenImage get pedikur =>
      const AssetGenImage('assets/images/profile/pedikur.png');

  /// File path: assets/images/profile/plus.png
  AssetGenImage get plus =>
      const AssetGenImage('assets/images/profile/plus.png');

  /// File path: assets/images/profile/point.png
  AssetGenImage get point =>
      const AssetGenImage('assets/images/profile/point.png');

  /// File path: assets/images/profile/rating.png
  AssetGenImage get rating =>
      const AssetGenImage('assets/images/profile/rating.png');

  /// File path: assets/images/profile/resnitsy.png
  AssetGenImage get resnitsy =>
      const AssetGenImage('assets/images/profile/resnitsy.png');

  /// File path: assets/images/profile/settings.png
  AssetGenImage get settings =>
      const AssetGenImage('assets/images/profile/settings.png');

  /// File path: assets/images/profile/share.png
  AssetGenImage get share =>
      const AssetGenImage('assets/images/profile/share.png');

  /// File path: assets/images/profile/strishka.png
  AssetGenImage get strishka =>
      const AssetGenImage('assets/images/profile/strishka.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        ava,
        avatar,
        bell,
        brovi,
        comments,
        location,
        mainPicture,
        manikur,
        pedikur,
        plus,
        point,
        rating,
        resnitsy,
        settings,
        share,
        strishka
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
