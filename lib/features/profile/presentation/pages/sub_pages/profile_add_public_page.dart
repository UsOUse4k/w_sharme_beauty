import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';

class ProfileAddPublicPage extends StatelessWidget {
  const ProfileAddPublicPage({super.key});

  static const String route = 'profile-add-public';

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      horizontalPadding: 16,
      appBar: AppBar(
        title: const Text(
          "Публикация",
          style: AppStyles.w500f22,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Выберите фото или видео",
            style: AppStyles.w500f16.copyWith(
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            "assets/images/profile/add_public.png",
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 20),
          AddingButton(
            text: "+ Выбрать из галереи",
            onPressed: () {},
          ),
          const SizedBox(height: 20),
          TextFieldWidgetWithTitle(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              title: "Описание",
              titleStyle: AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
              hintText: "Напишите сообщение",),
          const Spacer(),
          GlButton(text: "Опубликовать", onPressed: () {}),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
