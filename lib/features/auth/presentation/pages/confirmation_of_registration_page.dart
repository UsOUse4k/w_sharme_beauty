import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/auth/presentation/pages/profile_data_auth_page.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/pinput_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/text_auth_widget.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/title_auth_widget.dart';
final _formKey = GlobalKey<FormState>();

class ConfirmationOfRegistrationPage extends StatelessWidget {
  const ConfirmationOfRegistrationPage({super.key});

  static const String route = '/confirm-register';


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
                            'Мы отправили SMS с кодом на Ваш телефон или в эл.почту введите его.',
                      ),
                      SizedBox(height: 31),
                      PinputAuthWidget(),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Отправить повторно через 00:55',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA2A8B0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GlButton(
                  text: 'Продолжить',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.goNamed(ProfileDataAuthPage.route);
                    }
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
