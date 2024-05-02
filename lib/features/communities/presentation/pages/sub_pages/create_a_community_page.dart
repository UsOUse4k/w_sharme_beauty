import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommunityCreatePage extends StatelessWidget {
  const CommunityCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    GoRouter.of(context);
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(
          child: Text(
            "Создать сообщества",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const TextFieldWidgetWithTitle(
              title: "Название сообщества",
              hintText: "Придумайте название",
            ),
            const SizedBox(height: 14),
            const TextFieldWidgetWithTitle(
              title: "Выберите категорию",
              hintText: "Выберите категорию",
              suffixIcon: Icon(Icons.expand_more_outlined),
            ),
            const SizedBox(height: 14),
            const Text(
              "Установите аватар",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 8),
            Image.asset(Assets.images.ava.path),
            const SizedBox(
              height: 50,
            ),
            AddingButton(text: '+ Выбрать фото', onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidgetWithTitle(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              title: "Описание",
              titleStyle: AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
              hintText: "Расскажите о сообществе",
            ),
            Text(
              "Используйте слова, которые описывают тематику сообщества и помогают быстрее его найти. Изменить описание можно в любой момент.",
              style: AppStyles.w400f13.copyWith(color: AppColors.darkGrey),
            ),
            const SizedBox(
              height: 80,
            ),
            GlButton(text: 'Создать сообщество', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
