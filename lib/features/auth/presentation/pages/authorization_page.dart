import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/title_auth_widget.dart';

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
                Flexible(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleAuthWidget(title: 'Авторизоваться'),
                      const SizedBox(height: 20),
                      const TextAuthWidget(
                        text:
                            'Что-бы пользоваться сервисом на любом устройстве.',
                      ),
                      const SizedBox(height: 20),
                      const GlTextFormField(
                        obscureText: false,
                        hintText: 'Эл.адрес или номер телефона',
                      ),
                      const SizedBox(height: 10),
                      const GlTextFormField(
                        obscureText: true,
                        hintText: 'Введите пароль',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.goNamed(RouterContants.reset);
                            },
                            child: Text(
                              'забыли пароль',
                              style: AppStyles.w400f16.copyWith(
                                color: AppColors.purple,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GlButton(
                  text: 'Войти',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.goNamed(RouterContants.home);
                    }
                  },
                ),
                GlTextButton(
                  text: 'Регистрация',
                  onPressed: () {
                    context.goNamed(RouterContants.register);
                  },
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
