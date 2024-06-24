import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:injectable/injectable.dart';

export 'package:firebase_dynamic_links/firebase_dynamic_links.dart'
    show SocialMetaTagParameters;

typedef OnNewDynamicLinkPath = void Function(String newDynamicLinkPath);

/// Wrapper around [FirebaseDynamicLinks].
@lazySingleton
class DynamicLinkService {
  static const _domainUriPrefix = 'https://wsharmebeauty.page.link';
  static const _iOSBundleId = 'com.example.wSharmeBeauty';
  static const _androidPackageName = 'com.example.w_sharme_beauty';

  DynamicLinkService(this.dynamicLinks);

  final FirebaseDynamicLinks dynamicLinks;

  Future<String> generateDynamicLinkUrl({
    required String path,
    SocialMetaTagParameters? socialMetaTagParameters,
  }) async {
    final parameters = DynamicLinkParameters(
      uriPrefix: _domainUriPrefix,
      link: Uri.parse(
        '$_domainUriPrefix$path',
      ),
      androidParameters: const AndroidParameters(
        packageName: _androidPackageName,
      ),
      iosParameters: const IOSParameters(
        bundleId: _iOSBundleId,
      ),
      socialMetaTagParameters: socialMetaTagParameters,
    );

    final shortLink = await dynamicLinks.buildShortLink(parameters);
    return shortLink.shortUrl.toString();
  }

  Future<String?> getInitialDynamicLinkPath() async {
    final data = await dynamicLinks.getInitialLink();
    final link = data?.link;
    return link?.path;
  }

  Stream<String> onNewDynamicLinkPath() {
    return dynamicLinks.onLink.map(
      (PendingDynamicLinkData data) {
        final link = data.link;
        final path = link.path;
        return path;
      },
    );
  }
}
