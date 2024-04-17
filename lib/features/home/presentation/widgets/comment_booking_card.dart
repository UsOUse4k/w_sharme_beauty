import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/home/data/model/model.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommentBookingCard extends StatelessWidget {
  const CommentBookingCard({
    super.key,
    required this.item,
  });

  final CommentsModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: CircleAvatar(
            backgroundImage: AssetImage(
              Assets.images.avatar.path,
            ),
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
