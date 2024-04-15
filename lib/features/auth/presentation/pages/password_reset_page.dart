import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/widgets/widgets.dart';

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
                      CountyPicker(),
                    ],
                  ),
                ),
                const Spacer(),
                GlButton(
                  text: 'Отправить код',
                  onPressed: () {
                    context.goNamed(RouterContants.confirmPassword);
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
