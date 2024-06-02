import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_item_text.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_comment_like_bloc/question_comment_like_bloc.dart';

class QuestionCommentReplyItem extends StatefulWidget {
  const QuestionCommentReplyItem({
    super.key,
    required this.onPressed,
    required this.item,
    required this.parentCommentId,
    required this.questionId,
  });

  final Function() onPressed;
  final Comment item;
  final String parentCommentId;
  final String questionId;

  @override
  State<QuestionCommentReplyItem> createState() =>
      _QuestionCommentReplyItemState();
}

class _QuestionCommentReplyItemState extends State<QuestionCommentReplyItem> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  void initState() {
    likeCount = widget.item.likes.length;
    isLiked = widget.item.likes.contains(firebaseAuth.currentUser!.uid);
    setState(() {});
    super.initState();
  }

  void toggleIsLiked() {
    if (!isLiked) {
      context.read<QuestionCommentLikeBloc>().add(
            QuestionCommentLikeEvent.likeComment(
              isLiked: isLiked,
              commentId: widget.parentCommentId,
              questionId: widget.questionId,
              subCommentId: widget.item.commentId,
            ),
          );
      likeCount += 1;
    } else {
      context.read<QuestionCommentLikeBloc>().add(
            QuestionCommentLikeEvent.likeComment(
              isLiked: isLiked,
              commentId: widget.parentCommentId,
              questionId: widget.questionId,
              subCommentId: widget.item.commentId,
            ),
          );
      likeCount -= 1;
    }
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = widget.item.createdAt!;
    final String formattedDate = formatDateTime(timestamp);
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
                child: InkWell(
                  onTap: () {
                    if (widget.item.avatarUrl != '') {
                      context.push(
                        '/question/question-datail/${widget.questionId}/profilePersonPage/${widget.item.uid}',
                      );
                    }
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: GlCachedNetworImage(
                      height: 40.h,
                      width: 40.w,
                      urlImage: widget.item.avatarUrl,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Column(
                  children: [
                    CommentItemText(
                      key: ValueKey(widget.item.commentId),
                      username: widget.item.username.toString(),
                      comment: widget.item.comment.toString(),
                      data: formattedDate,
                      like: likeCount.toString(),
                      id: widget.parentCommentId,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: toggleIsLiked,
                  child: isLiked
                      ? const Icon(Icons.favorite, color: AppColors.red)
                      : const Icon(Icons.favorite_outline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
