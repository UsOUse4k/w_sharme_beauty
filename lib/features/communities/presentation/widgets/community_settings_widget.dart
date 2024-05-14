import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunitySettingsWidget extends StatelessWidget {
  const CommunitySettingsWidget({
    super.key,
    required this.route,
  });

  final GoRouter route;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.white,
      ),
      child: GlScaffold(
        horizontalPadding: 16,
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTilleWidgetTextWith(
                image: Assets.icons.edit.path,
                title: 'Основной',
                subTitle: 'Редактировать сообщество',
                onPressed: () {
                  route.push(
                    '/communities/${RouterContants.communityEdit}',
                  );
                },
              ),
              ListTilleWidgetTextWith(
                image: Assets.icons.message.path,
                title: 'Общение',
                subTitle: 'Чаты',
                onPressed: () {
                  route.push(
                    '/communities/${RouterContants.communityChat}',
                  );
                },
              ),
              ListTilleWidgetTextWith(
                image: Assets.icons.managers.path,
                title: 'Участники',
                subTitle: 'Руководители',
                onPressed: () {
                  route.push(
                    '/communities/${RouterContants.communityManagers}',
                  );
                },
              ),
              ListTilleWidgetTextWith(
                image: Assets.icons.subscribers.path,
                subTitle: 'Подписчики',
                onPressed: () {
                  route.push(
                    '/communities/${RouterContants.communitySubscribers}',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
