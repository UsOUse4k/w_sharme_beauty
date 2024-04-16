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

  /// File path: assets/icons/account.png
  AssetGenImage get account => const AssetGenImage('assets/icons/account.png');

  /// File path: assets/icons/accountActive.png
  AssetGenImage get accountActive =>
      const AssetGenImage('assets/icons/accountActive.png');

  /// File path: assets/icons/activeAnnouncement.png
  AssetGenImage get activeAnnouncement =>
      const AssetGenImage('assets/icons/activeAnnouncement.png');

  /// File path: assets/icons/activeGroup.png
  AssetGenImage get activeGroup =>
      const AssetGenImage('assets/icons/activeGroup.png');

  /// File path: assets/icons/activeHome.png
  AssetGenImage get activeHome =>
      const AssetGenImage('assets/icons/activeHome.png');

  /// File path: assets/icons/activeIssue.png
  AssetGenImage get activeIssue =>
      const AssetGenImage('assets/icons/activeIssue.png');

  /// File path: assets/icons/announcement.png
  AssetGenImage get announcement =>
      const AssetGenImage('assets/icons/announcement.png');

  /// File path: assets/icons/bell.png
  AssetGenImage get bell => const AssetGenImage('assets/icons/bell.png');

  /// File path: assets/icons/brovi.png
  AssetGenImage get brovi => const AssetGenImage('assets/icons/brovi.png');

  /// File path: assets/icons/chat.png
  AssetGenImage get chat => const AssetGenImage('assets/icons/chat.png');

  /// File path: assets/icons/comment.png
  AssetGenImage get comment => const AssetGenImage('assets/icons/comment.png');

  /// File path: assets/icons/group.png
  AssetGenImage get group => const AssetGenImage('assets/icons/group.png');

  /// File path: assets/icons/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/icons/heart.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/issue.png
  AssetGenImage get issue => const AssetGenImage('assets/icons/issue.png');

  /// File path: assets/icons/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/icons/location.png');

  /// File path: assets/icons/manikur.png
  AssetGenImage get manikur => const AssetGenImage('assets/icons/manikur.png');

  /// File path: assets/icons/pedikur.png
  AssetGenImage get pedikur => const AssetGenImage('assets/icons/pedikur.png');

  /// File path: assets/icons/play.png
  AssetGenImage get play => const AssetGenImage('assets/icons/play.png');

  /// File path: assets/icons/plus.png
  AssetGenImage get plus => const AssetGenImage('assets/icons/plus.png');

  /// File path: assets/icons/point.png
  AssetGenImage get point => const AssetGenImage('assets/icons/point.png');

  /// File path: assets/icons/rating.png
  AssetGenImage get rating => const AssetGenImage('assets/icons/rating.png');

  /// File path: assets/icons/repost.png
  AssetGenImage get repost => const AssetGenImage('assets/icons/repost.png');

  /// File path: assets/icons/resnitsy.png
  AssetGenImage get resnitsy =>
      const AssetGenImage('assets/icons/resnitsy.png');

  /// File path: assets/icons/settings.png
  AssetGenImage get settings =>
      const AssetGenImage('assets/icons/settings.png');

  /// File path: assets/icons/strishka.png
  AssetGenImage get strishka =>
      const AssetGenImage('assets/icons/strishka.png');

  /// List of all assets
  List<dynamic> get values => [
        gitkeep,
        account,
        accountActive,
        activeAnnouncement,
        activeGroup,
        activeHome,
        activeIssue,
        announcement,
        bell,
        brovi,
        chat,
        comment,
        group,
        heart,
        home,
        issue,
        location,
        manikur,
        pedikur,
        play,
        plus,
        point,
        rating,
        repost,
        resnitsy,
        settings,
        strishka
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/.gitkeep
  String get gitkeep => 'assets/images/.gitkeep';

  /// File path: assets/images/ava.png
  AssetGenImage get ava => const AssetGenImage('assets/images/ava.png');

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/main_picture.png
  AssetGenImage get mainPicture =>
      const AssetGenImage('assets/images/main_picture.png');

  /// List of all assets
  List<dynamic> get values => [gitkeep, ava, avatar, mainPicture];
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
