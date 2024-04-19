import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/center_title_app_bar.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/home/data/data/post_data.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      appBar: GlAppBar(
        leading: Row(
          children: [
            GlCircleAvatar(
              avatar: Assets.images.avatar.path,
              width: 26,
              height: 26,
            ),
            const SizedBox(width: 16),
            const CenterTitleAppBar(
              title: 'Главная',
              textStyle: AppStyles.w500f22,
            ),
          ],
        ),
        action: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                context.push('/home/${RouterContants.homeNotification}');
              },
              child: Assets.icons.bell.image(width: 26, height: 26),
            ),
            GestureDetector(
              onTap: () {
                context.push('/home/${RouterContants.chat}');
              },
              child: Assets.icons.chat.image(width: 26, height: 26),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: List.generate(posts.length, (index) {
            final post = posts[index];
            return PostCard(
              onPressed: () {
                context.push('/home/post/${post.id}');
              },
              post: post,
            );
          }),
        ),
      ),
    );
  }
}
