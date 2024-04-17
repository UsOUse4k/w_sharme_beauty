import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';

class ProfileNewEmailPage extends StatelessWidget {
  const ProfileNewEmailPage({super.key});
  static const String route = 'profile-new-email';
  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      horizontalPadding: 16,
      appBar: AppBar(
        title: const Text(
          'Введите новую почту',
          style: AppStyles.w500f22,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.lightGrey,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                constraints: const BoxConstraints(),
                isDense: true,
                filled: true,
                fillColor: AppColors.lightGrey,
                labelText: "Электронная почта",
                labelStyle:
                    AppStyles.w500f18.copyWith(color: AppColors.darkGrey),
                hintText: "Soyma@gmaiI.com",
                hintStyle: AppStyles.w500f18.copyWith(color: AppColors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const Spacer(),
          GlButton(
            text: 'Отправить',
            onPressed: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
