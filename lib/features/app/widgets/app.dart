import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/auth/presentation/pages/password_reset_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PasswordResetPage(),
    );
  }
}
