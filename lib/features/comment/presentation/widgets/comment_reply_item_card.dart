import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/gl_circle_avatar.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_item_text.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class CommentItemReplyCard extends StatefulWidget {
  const CommentItemReplyCard({
    super.key,
    required this.onPressed,
    required this.item,
    required this.parentCommentId,
    required this.postId,
  });

  final Function() onPressed;
  final Comment item;
  final String parentCommentId;
  final String postId;

  @override
  State<CommentItemReplyCard> createState() => _CommentItemReplyCardState();
}

class _CommentItemReplyCardState extends State<CommentItemReplyCard> {
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
      context.read<CommentLikesBloc>().add(
            CommentLikesEvent.likeComment(
              commentId: widget.parentCommentId,
              postId: widget.postId,
              isLiked: isLiked,
              subCommentId: widget.item.commentId,
            ),
          );
      likeCount += 1;
    } else {
      context.read<CommentLikesBloc>().add(
            CommentLikesEvent.likeComment(
              commentId: widget.parentCommentId,
              postId: widget.postId,
              isLiked: isLiked,
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
    final currentUid = firebaseAuth.currentUser!.uid;
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
                    if (currentUid != widget.item.uid) {
                      context.push(
                        '/home/${RouterContants.profilePersonPage}/${widget.item.uid}',
                      );
                    }
                  },
                  child: GlCircleAvatar(
                    avatar: widget.item.avatarUrl.toString(),
                    width: 40.w,
                    height: 40.h,
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
