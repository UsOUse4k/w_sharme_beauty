import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';

class AdvertsPage extends StatelessWidget {
  const AdvertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      body: Center(
        child: CustomBottomSheet(
          navbarTitle: 'Сменить пароль',
          onSave: () {},
          titleOnSave: 'Сохранить',
          widget: const Text('widget'),
          titleButton: 'clicked',
        ),
      ),
    );
  }
}
