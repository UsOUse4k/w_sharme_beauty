import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/center_title_app_bar.dart';
import 'package:w_sharme_beauty/core/widgets/gl_app_bar.dart';
import 'package:w_sharme_beauty/core/widgets/gl_circle_avatar.dart';
import 'package:w_sharme_beauty/core/widgets/gl_icon_button.dart';
import 'package:w_sharme_beauty/core/widgets/gl_scaffold.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/subscribers_list_tile_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunityChatPage extends StatelessWidget {
  const CommunityChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: const CenterTitleAppBar(
          title: 'Чаты',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Чаты сообщества",
            style: AppStyles.w500f14.copyWith(color: AppColors.darkGrey),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              GlCircleAvatar(
                avatar: Assets.icons.addChat.path,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Создать чат",
                  style: AppStyles.w400f16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SubscribersListTileWidget(
            title: "Комьюнити",
            subtitle: "152 участников",
            avatar: Assets.images.ava.path,
          ),
        ],
      ),
    );
  }
}
