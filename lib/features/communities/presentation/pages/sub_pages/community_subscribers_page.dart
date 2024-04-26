import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/custom_bottom_sheet_center_title.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/subscribers_list_tile_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunitySubscribersPage extends StatelessWidget {
  const CommunitySubscribersPage({super.key});

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
          title: 'Подписчики',
          textStyle: AppStyles.w500f22,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const SearchWidget(),
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return SubscribersListTileWidget(
                    title: "Nasya",
                    subtitle: "с 12.02.2024",
                    avatar: Assets.images.irina.path,
                    onTap: () {
                      BottomSheetUtil.showAppBottomSheet(
                        context,
                        CustomBottomSheetCenterTitle(
                          maxHeight: 0.3,
                          navbarTitle1: "Назначить руководителем",
                          navbarTitle2: "Удалить из сообщества",
                          widget: GlButton(text: "Отменить", onPressed: () {}),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
