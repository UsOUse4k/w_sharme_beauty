import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/gl_circle_avatar.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class BeutyList extends StatelessWidget {
  BeutyList.beautyList({super.key});
  final List<String> kategories = [
    "Маникюр, 152 участников",
    "Ресницы, 152 участников",
    "Брови, 152 участников",
    "Стрижка, 152 участников",
    "Маникюр, 152 участников",
    "Брови, 152 участников",
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .push('/communities/${RouterContants.communityProfileSubscribe}');
      },
      child: ListView.builder(
        itemCount: kategories.length,
        itemExtent: 55,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: GlCircleAvatar(
              avatar: Assets.images.ava.path,
              width: 46,
              height: 46,
            ),
            title: const Text(
              "Комьюнити",
              style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              kategories[index],
              style: const TextStyle(fontSize: 14, color: AppColors.darkGrey),
            ),
          );
        },
      ),
    );
  }
}
