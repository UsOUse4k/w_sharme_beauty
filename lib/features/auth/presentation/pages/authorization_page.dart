import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/core/widgets/gl_text_button.dart';
import 'package:w_sharme_beauty/core/widgets/gl_text_form_field.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/text_auth_widget/text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/title_auth_widget/title_auth_widget.dart';

final _formKey = GlobalKey<FormState>();

class AuthorizationPage extends StatelessWidget {
  const AuthorizationPage({super.key});

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
                      TitleAuthWidget(title: 'Авторизоваться'),
                      SizedBox(height: 20),
                      TextAuthWidget(
                        text:
                            'Что-бы пользоваться сервисом на любом устройстве.',
                      ),
                      SizedBox(height: 20),
                      GlTextFormField(
                        obscureText: false,
                        hintText: 'Эл.адрес или номер телефона',
                      ),
                      SizedBox(height: 10),
                      GlTextFormField(
                        obscureText: true,
                        hintText: 'Введите пароль',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GlButton(
                  text: 'Войти',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                GlTextButton(
                  text: 'Регистрация',
                  onPressed: () {},
                  color: AppColors.purple,
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
