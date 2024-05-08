import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';

class CommentItemText extends StatelessWidget {
  const CommentItemText({
    super.key,
    required this.comment,
    required this.data,
    required this.like,
    required this.username,
    required this.id, 
  });

  final String comment;
  final String data;
  final String like;
  final String username;
  final String id;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          username,
          style: AppStyles.w500f16,
        ),
        Text(
          comment,
          style: AppStyles.w400f16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data,
              style: AppStyles.w400f14.copyWith(color: AppColors.grey),
            ),
            Text(
              'Нравится: $like',
              style: AppStyles.w400f14,
            ),
            GestureDetector(
              onTap: () {
                context.read<ParentCommentIdBloc>().add(
                      ParentCommentIdEvent.addParentCommentId(
                        id,
                        username,
                      ),
                    );
              },
              child: Text(
                'Ответить',
                style: AppStyles.w400f14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
