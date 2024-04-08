import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/consent_text_auth_widget/consent_text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/text_auth_widget/text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/title_auth_widget/title_auth_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
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
                    ConsentTextAuthWidget(),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                height: 47,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBA75FE),
                  ),
                  child: const Text(
                    'Продолжить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
