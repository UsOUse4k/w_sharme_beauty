import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/text_auth_widget/text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/title_auth_widget/title_auth_widget.dart';

class ConfirmationOfRegistrationPage extends StatelessWidget {
  const ConfirmationOfRegistrationPage({super.key});

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
                    TitleAuthWidget(title: 'Данные профиля'),
                    SizedBox(height: 20),
                    TextAuthWidget(
                      text: 'Заполните личные данные, чтобы иметь доступ к своим заказам и результатам в приложении',
                    ),
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
                    'Сохранить',
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
