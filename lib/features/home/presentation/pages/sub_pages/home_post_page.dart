import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/home/data/data/comments_data.dart';
import 'package:w_sharme_beauty/features/home/data/model/post_card_model.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class HomePostPage extends StatelessWidget {
  const HomePostPage({super.key, required this.post});

  final PostCardModel post;

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Запись',
          textStyle: AppStyles.w500f22,
          key: ValueKey(post.id),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ListView(
            children: [
              PostCard(onPressed: () {},),
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${post.comments} Комментариев',
                      style: AppStyles.w500f14.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(commentItems.length, (index) {
                        final item = commentItems[index];
                        return Column(
                          children: [
                            CommentBookingCard(
                              item: item,
                              avatar: Assets.images.avatar.path,
                            ),
                            const SizedBox(height: 6),
                            if (index == 0)
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(),
                                  ),
                                  Flexible(
                                    flex: 8,
                                    child: CommentBookingCard(
                                      item: item,
                                      avatar: Assets.images.avatar.path,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
