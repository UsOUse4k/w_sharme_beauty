import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfileNavbarWidget extends StatelessWidget {
  const ProfileNavbarWidget({
    super.key,
    required this.avatar,
    required this.publications,
    required this.followers,
    required this.subscriptions,
  });

  final String avatar;
  final String publications;
  final String followers;
  final String subscriptions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlCircleAvatar(
          avatar: Assets.images.avatar.path,
          width: 70,
          height: 70,
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          children: [
            Text(
              publications,
              style: AppStyles.w500f16,
            ),
            const Text("Публикации", style: AppStyles.w400f14),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(followers, style: AppStyles.w500f16),
            const Text("Подписчиков", style: AppStyles.w400f14),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            Text(subscriptions, style: AppStyles.w500f16),
            const Text("Подписок", style: AppStyles.w400f14),
          ],
        ),
      ],
    );
  }
}
