import 'package:flutter/material.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_theme.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        title: const Text(
          "Настройки",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "УЧЕТНЫЕ ДАННЫЕ",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: AppColors.white,),
            child: const Column(
              children: [
                ProfileSettingItemWidget(
                  title: 'Телефон',
                  subtitle: '+7 707 707 7707',
                ),
                ProfileSettingItemWidget(
                  title: 'День рождения',
                  subtitle: '21.02.2001',
                ),
                ProfileSettingItemWidget(
                  title: 'Email',
                  subtitle: 'Не указан',
                  isVisible: false,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const ProfileSettingCardItemWidget(
            text: 'ПАРОЛЬ',
            title: 'Сменить пароль',
          ),
          const SizedBox(
            height: 15,
          ),
          const ProfileSettingCardItemWidget(
            text: 'УВЕДОМЛЕНИЯ',
            title: 'Настройки уведомления',
          ),
          const SizedBox(
            height: 15,
          ),
          ProfileSettingCardItemWidget(
            text: 'АККАУНТ',
            title: 'Выйти из аккаунта',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.red,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

class ProfileSettingCardItemWidget extends StatelessWidget {
  final String text;
  final String title;
  final TextStyle? style;
  const ProfileSettingCardItemWidget(
      {super.key,
      required this.text,
      required this.title,
      this.style = const TextStyle(
        fontSize: 14,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.white,
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: style,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}

class ProfileSettingItemWidget extends StatelessWidget {
  final String? title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool? isVisible;
  const ProfileSettingItemWidget({
    super.key,
    this.title,
    required this.subtitle,
    this.onTap,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.zero,
          title: title == null
              ? null
              : Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: theme.disabledColor,
                        fontWeight: FontWeight.w700,
                      ),
                ),
          subtitle: Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        if (isVisible == true)
          Divider(
            color: Theme.of(context).disabledColor,
            thickness: 0.5,
            height: 1,
          ),
      ],
    );
  }
}
