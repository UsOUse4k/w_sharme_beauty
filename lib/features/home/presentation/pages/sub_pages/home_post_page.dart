import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/widgets/center_title_app_bar.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/home/data/model/post_card_model.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/post_card_widget.dart';

class HomePostPage extends StatelessWidget {
  const HomePostPage({super.key, required this.post});

  final PostCardModel post;

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      appBar: GLAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Уведомления',
          key: UniqueKey(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ListView(
            children: [
              PostCard(onPressed: () {}, post: post),
            ],
          ),
        ),
      ),
    );
  }
}
