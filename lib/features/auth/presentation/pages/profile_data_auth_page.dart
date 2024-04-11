import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/title_auth_widget.dart';

final _formKey = GlobalKey<FormState>();

class ProfileDataAuthPage extends StatelessWidget {
  const ProfileDataAuthPage({super.key});

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
                      TitleAuthWidget(title: 'Данные профиля'),
                      SizedBox(height: 20),
                      TextAuthWidget(
                        text:
                            'Заполните личные данные, чтобы иметь доступ к своим заказам и результатам в приложении',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GlButton(
                  text: 'Сохранить',
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
