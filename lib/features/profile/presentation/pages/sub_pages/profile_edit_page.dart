import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_theme.dart';
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
          title: Text(
            'Редактировать профиль',
            style: theme.textTheme.titleMedium,
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
                    Text(
                      "Ваш аватар",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.disabledColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(Assets.images.ava.path),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightPurple,
                          shape: const RoundedRectangleBorder(),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "+ Изменить фото или аватар",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
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
                    icon: Icon(
                      Icons.expand_more,
                      color: theme.colorScheme.primary,
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

class TextFieldWidgetWithTitle extends StatelessWidget {
  const TextFieldWidgetWithTitle({
    super.key,
    required this.title,
    required this.hintText,
    this.suffixIcon,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
  });
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.disabledColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: contentPadding,
            constraints: const BoxConstraints(),
            isDense: true,
            filled: true,
            fillColor: AppColors.lightGrey,
            hintText: hintText,
            hintStyle: TextStyle(
              color: theme.disabledColor,
            ),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
