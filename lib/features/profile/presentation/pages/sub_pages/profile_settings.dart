import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:w_sharme_beauty/core/theme/app_colors.dart';

import 'package:w_sharme_beauty/features/profile/presentation/widgets/profile_setting_card_item_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/profile_setting_item_widget.dart';

import 'profile_new_email_page.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});
  static const String route = 'profile-settings';
  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
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
                borderRadius: BorderRadius.circular(4), color: AppColors.white),
            child: Column(
              children: [
                const ProfileSettingItemWidget(
                  title: 'Телефон',
                  subtitle: '+7 707 707 7707',
                ),
                const ProfileSettingItemWidget(
                  title: 'День рождения',
                  subtitle: '21.02.2001',
                ),
                ProfileSettingItemWidget(
                  onTap: () {
                    context.goNamed(ProfileNewEmailPage.route);
                  },
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
