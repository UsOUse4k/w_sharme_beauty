import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});
  static const String route = 'profile-edit';

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
          centerTitle: true,
          title: const Text(
            'Редактировать профиль',
            style: AppStyles.w500f18,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ваш аватар",
                      style: AppStyles.w500f16,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(Assets.images.ava.path),
                    const SizedBox(
                      height: 10,
                    ),
                    AddingButton(
                      onPressed: () {},
                      text: "+ Изменить фото или аватар",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldWidgetWithTitle(
                  title: 'Имя',
                  hintText: 'Придумайте имя вопроса',
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldWidgetWithTitle(
                  title: 'Имя пользователя',
                  hintText: 'Имя пользователя',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidgetWithTitle(
                  title: 'Чем вы занимаетесь?',
                  hintText: 'Выберите категорию',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.expand_more,
                      color: AppColors.purple,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldWidgetWithTitle(
                  title: 'Ваше местоположение',
                  hintText: 'Ваше местоположение',
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldWidgetWithTitle(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  title: 'О себе',
                  hintText: 'Расскажите о себе',
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Сохранить изменения",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
