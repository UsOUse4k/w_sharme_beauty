import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_app_bar.dart';
import 'package:w_sharme_beauty/core/widgets/gl_scaffold.dart';

import 'package:w_sharme_beauty/features/adverts/presentation/widgets/card_bloc_edit_widget.dart';

class AdvertMyAdvertsPage extends StatelessWidget {
  const AdvertMyAdvertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      appBar: GlAppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Мои объявления",
          style: AppStyles.w500f22,
        ),
      ),
      body: const Column(
        children: [
          SizedBox(height: 15),
          CardBlocEditWidget(
            title: 'Бонус',
            desc: 'Ногтевая студия, Салон красоты, Парихмакерская',
            rating: '4.2',
          ),
          SizedBox(height: 36),
          CardBlocEditWidget(
            title: 'Anna Ivanova',
            desc: 'Маникюр, Педикюр, ресницы',
            rating: '4.1',
          ),
        ],
      ),
    );
  }
}
