import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/core/widgets/gl_text_form_field.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/consent_text_auth_widget/consent_text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/text_auth_widget/text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/title_auth_widget/title_auth_widget.dart';

final _formKey = GlobalKey<FormState>();

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                      TitleAuthWidget(title: 'Регистрация'),
                      SizedBox(height: 20),
                      TextAuthWidget(
                        text:
                            'Введите электронный адрес или номер телефона и придумайте пароль.',
                      ),
                      SizedBox(height: 20),
                      GlTextFormField(
                        obscureText: false,
                        hintText: 'Эл.адрес или номер телефона',
                      ),
                      SizedBox(height: 10),
                      GlTextFormField(
                        obscureText: true,
                        hintText: 'Придумайте пароль',
                      ),
                      SizedBox(height: 20),
                      ConsentTextAuthWidget(),
                    ],
                  ),
                ),
                const Spacer(),
                GlButton(
                  text: 'Продолжить',
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
