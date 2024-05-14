import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/text_field_widget_buttom_sheet.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';
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
              TextFieldWidgetWithTitle(
                filled: false,
                prefixIcon: Image.asset(Assets.icons.edit.path),
                title: 'Основное',
                hintText: 'Редактировать сообщество',
                hintStyle: AppStyles.w400f16.copyWith(
                  color: AppColors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    route.push(
                      '/communities/${RouterContants.communityEdit}',
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              TextFieldWidgetWithTitle(
                filled: false,
                prefixIcon: Image.asset(Assets.icons.message.path),
                title: 'Общение',
                hintText: 'Чаты',
                hintStyle: AppStyles.w400f16.copyWith(
                  color: AppColors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    route.push(
                      '/communities/${RouterContants.communityChat}',
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              TextFieldWidgetWithTitle(
                filled: false,
                prefixIcon: Image.asset(Assets.icons.managers.path),
                title: 'Участники',
                hintText: 'Руководители',
                hintStyle: AppStyles.w400f16.copyWith(
                  color: AppColors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    route.push(
                      '/communities/${RouterContants.communityManagers}',
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              TextFieldWidgetButtomSheet(
                filled: false,
                prefixIcon:
                    Image.asset(Assets.icons.subscribers.path),
                hintText: 'Подписчики',
                hintStyle: AppStyles.w400f16.copyWith(
                  color: AppColors.black,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    route.push(
                      '/communities/${RouterContants.communitySubscribers}',
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
