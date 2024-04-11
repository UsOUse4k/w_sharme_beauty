import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/text_auth_widget/text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/title_auth_widget/title_auth_widget.dart';

final _formKey = GlobalKey<FormState>();

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Flexible(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleAuthWidget(title: 'Сброс пароля'),
                      SizedBox(height: 20),
                      TextAuthWidget(
                        text: 'Чтобы сбросить пароль, введите номер телефона:',
                      ),
                      SizedBox(height: 20),
                      GlCountyPicker(),
                    ],
                  ),
                ),
                const Spacer(),
                GlButton(
                  text: 'Отправить код',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlCountyPicker extends StatelessWidget {
  const GlCountyPicker({
    super.key,
    this.controller,
  });

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: 'KG',
      controller: controller,
      decoration: const InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.all(20),
        hintText: 'Номер телефона',
        fillColor: AppColors.lightGrey,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
