import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_item_text.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CommentItemReplyCard extends StatelessWidget {
  const CommentItemReplyCard({
    super.key,
    required this.onPressed,
    required this.item,
  });

  final Function() onPressed;
  final Comment item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 35.w),
              Flexible(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: GlCachedNetworImage(
                    height: 40.h,
                    width: 40.w,
                    urlImage: item.avatarUrl,
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Column(
                  children: [
                    CommentItemText(
                      username: item.username.toString(),
                      comment: item.comment.toString(),
                      data: 'сегодня в 15:53',
                      like: '0',
                      id: '',
                    ),
                  ],
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
          ),
        ],
      ),
    );
  }
}
