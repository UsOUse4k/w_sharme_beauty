import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/questiin_comment_item.dart';

class QuestionCommentList extends StatelessWidget {
  const QuestionCommentList({
    super.key,
    required this.comments,
    required this.questionId,
  });

  final List<Comment> comments;
  final String questionId;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return QuestionCommentItem(
          key: ValueKey(comments[index].commentId),
          item: comments[index],
          questionId: questionId,
          onPressed: () {},
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6.h),
      itemCount: comments.length,
    );
  }
}
