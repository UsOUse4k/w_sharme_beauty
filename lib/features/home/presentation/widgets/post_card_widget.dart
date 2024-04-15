import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_subscribe_button.dart';
import 'package:w_sharme_beauty/core/widgets/user_avatar_with_name.dart';
import 'package:w_sharme_beauty/features/home/data/model/post_card_model.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/post_icons_widget.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.onPressed,
    this.index,
    required this.post,
  });

  final PostCardModel post;
  final Function() onPressed;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, top: index == 0 ? 16 : 0),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: UserAvatarWithName(
                  width: 40,
                  height: 40,
                  avatar: post.avatar,
                  name: post.username,
                  subTitle: post.data,
                ),
              ),
              const Flexible(
                child: GlSubscribeButton(),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            post.text,
            style: AppStyles.w400f16,
          ),
          if (post.postImages != null) const SizedBox(height: 6),
          if (post.postImages != null) post.postImages!,
          const SizedBox(height: 6),
          Row(
            children: [
              PostIconsWidget(
                onPessed: () {},
                icon: 'assets/icons/heart.png',
                text: post.like,
              ),
              const SizedBox(width: 6),
              PostIconsWidget(
                onPessed: onPressed,
                icon: 'assets/icons/heart.png',
                text: post.comments,
              ),
              const SizedBox(width: 6),
              PostIconsWidget(
                onPessed: () {},
                icon: 'assets/icons/heart.png',
                text: post.repost,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
