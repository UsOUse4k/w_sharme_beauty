import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';

class StarMarcsWidget extends StatelessWidget {
  const StarMarcsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: ListTile(
        title: InkWell(
          onTap: () => BottomSheetUtil.showAppBottomSheet(
            context,
            CustomBottomSheet(
              maxHeight: 0.6,
              navbarTitle: 'Оставьте отзыв',
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    const SizedBox(height: 18),
                    const StarMarcsWidget(),
                    const SizedBox(height: 18),
                    TextFieldWidgetWithTitle(
                      title: 'Комментарий',
                      titleStyle: AppStyles.w500f16.copyWith(
                        color: AppColors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 60,
                        horizontal: 10,
                      ),
                      hintText: 'Оставьте комментарий...',
                    ),
                    const SizedBox(height: 30),
                    GlButton(
                      text: 'Готово',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: Text(
            "Были здесь? Напишите отзыв",
            style: AppStyles.w500f18.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
        ),
        subtitle: const Row(
          children: [
            Icon(
              Icons.star,
              color: AppColors.darkGrey,
              size: 40,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkGrey,
              size: 40,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkGrey,
              size: 40,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkGrey,
              size: 40,
            ),
            Icon(
              Icons.star,
              color: AppColors.darkGrey,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
