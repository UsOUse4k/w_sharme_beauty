import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/widgets/gl_circle_avatar.dart';

import 'package:w_sharme_beauty/features/home/data/model/model.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommentBookingCard extends StatelessWidget {
  const CommentBookingCard({
    super.key,
    required this.avatar,
    required this.item,
  });
  final String avatar;
  final CommentsModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: GlCircleAvatar(
            avatar: avatar,
            width: 48,
            height: 48,
          ),
        ),
        Flexible(
          flex: 8,
          child: CommentItem(
            username: item.username,
            comment: item.comment,
            data: 'сегодня в 15:53',
            like: item.like,
          ),
        ),
        Flexible(
          child: Image(
            width: 16,
            height: 16,
            image: AssetImage(
              Assets.icons.heart.path,
            ),
          ),
        ),
      ],
    );
  }
}
