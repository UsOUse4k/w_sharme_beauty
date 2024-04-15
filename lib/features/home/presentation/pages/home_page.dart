import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_scaffold.dart';
import 'package:w_sharme_beauty/features/home/data/data_source/post_data.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/post_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'Главная',
          style: AppStyles.w500f22,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: List.generate(posts.length, (index) {
            final post = posts[index];
            return PostCard(onPressed: () {}, post: post);
          }),
        ),
      ),
    );
  }
}
