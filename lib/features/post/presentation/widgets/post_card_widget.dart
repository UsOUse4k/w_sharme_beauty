import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_subscribe_button.dart';
import 'package:w_sharme_beauty/core/widgets/user_avatar_with_name.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/post.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_icons_widget.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_image.dart';

final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.onPressed,
    this.index,
    this.post,
  });

  final Post? post;
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
                  width: 40.w,
                  height: 40.h,
                  name: 'Alina',
                  subTitle: post!.createdAt.toString(),
                ),
              ),
              if (firebaseAuth.currentUser!.uid == post!.uid)
                const Icon(Icons.more_horiz)
              else
                const Flexible(
                  child: GlSubscribeButton(),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            post!.text,
            style: AppStyles.w400f16,
          ),
          if (post != null && post!.imageUrls.isNotEmpty)
            const SizedBox(height: 6),
          if (post != null && post!.imageUrls.isNotEmpty)
            PostImage(
              imageUrls: post!.imageUrls,
            ),
          const SizedBox(height: 6),
          Row(
            children: [
              PostIconsWidget(
                onPessed: () {},
                icon: 'assets/icons/heart.png',
                text: post!.likes.toString(),
              ),
              const SizedBox(width: 6),
              PostIconsWidget(
                onPessed: onPressed,
                icon: 'assets/icons/comment.png',
                text: post!.comments.length.toString(),
              ),
              const SizedBox(width: 6),
              PostIconsWidget(
                onPessed: () {},
                icon: 'assets/icons/repost.png',
                text: post!.reposts.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
