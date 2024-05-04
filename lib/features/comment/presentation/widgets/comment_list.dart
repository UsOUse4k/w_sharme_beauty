import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/widgets.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key, required this.comments});

  final List<Comment> comments;

  void snowBottomShet () {
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${comments.length} Комментариев',
          style: AppStyles.w500f14.copyWith(
            color: AppColors.grey,
          ),
        ),
        const SizedBox(height: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(comments.length, (index) {
            final item = comments[index];
            return Column(
              children: [
                CommentBookingCard(
                  onPressed: snowBottomShet,
                  item: item,
                  avatar: item.avatarUrl.toString(),
                ),
                const SizedBox(height: 6),
              ],
            );
          }),
        ),
      ],
    );
  }
}
