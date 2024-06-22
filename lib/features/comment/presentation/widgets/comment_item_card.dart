import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class CommentItemCard extends StatefulWidget {
  final Comment item;
  final String postId;
  const CommentItemCard({
    super.key,
    required this.item,
    required this.postId,
  });

  @override
  _CommentItemCardState createState() => _CommentItemCardState();
}

class _CommentItemCardState extends State<CommentItemCard> {
  int likeCount = 0;
  bool isLiked = false;
  Map<String, bool> repliesVisibility = {};

  @override
  void initState() {
    isLiked = widget.item.likes.contains(firebaseAuth.currentUser!.uid);
    likeCount = widget.item.likes.length;
    setState(() {});
    super.initState();
  }

  void toggleIsLiked() {
    if (!isLiked) {
      context.read<CommentLikesBloc>().add(
            CommentLikesEvent.likeComment(
              commentId: widget.item.commentId,
              postId: widget.postId,
              isLiked: isLiked,
            ),
          );
      likeCount += 1;
    } else {
      context.read<CommentLikesBloc>().add(
            CommentLikesEvent.likeComment(
              commentId: widget.item.commentId,
              postId: widget.postId,
              isLiked: isLiked,
            ),
          );
      likeCount -= 1;
    }
    setState(() {
      isLiked = !isLiked;
    });
  }

  void getRepliesComment(String commentId) => {
        context.read<ReplyCommentListBloc>().add(
              ReplyCommentListEvent.getReplyComments(
                postId: widget.postId,
                parentCommentId: commentId,
              ),
            ),
      };

  void toggleRepliesVisibility(String commentId) {
    final bool isVisible = repliesVisibility[commentId] ?? false;
    repliesVisibility[commentId] = !isVisible;
    if (!isVisible) {
      getRepliesComment(commentId);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = widget.item.createdAt!;
    final String formattedDate = formatDateTime(timestamp);
    final currentUid = firebaseAuth.currentUser!.uid;
    return BlocListener<AddReplyCommentBloc, AddReplyCommentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (comment) {
            if (!(repliesVisibility[comment.parentCommentId] ?? false)) {
              setState(() {
                repliesVisibility[comment.parentCommentId!] = true;
              });
              getRepliesComment(comment.parentCommentId!);
              context.read<ReplyCommentListBloc>().add(
                    ReplyCommentListEvent.addNewComments(comment),
                  );
              context
                  .read<ParentCommentIdBloc>()
                  .add(const ParentCommentIdEvent.addParentCommentId('', ''));
            }
          },
          orElse: () {},
        );
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                flex: 8,
                child: Column(
                  children: [
                    CommentItemText(
                      key: ValueKey(widget.item.commentId),
                      username: widget.item.username.toString(),
                      comment: widget.item.comment.toString(),
                      data: formattedDate,
                      like: likeCount.toString(),
                      id: widget.item.commentId.toString(),
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
          if (widget.item.replies != 0)
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 25),
              child: InkWell(
                onTap: () =>
                    toggleRepliesVisibility(widget.item.commentId.toString()),
                child: Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 2.h,
                      decoration: const BoxDecoration(
                        color: AppColors.lightGrey,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      repliesVisibility[widget.item.commentId.toString()] ??
                              false
                          ? 'Скрыть ответы'
                          : 'Смотреть  ${widget.item.replies} ответов',
                    ),
                  ],
                ),
              ),
            ),
          if (repliesVisibility[widget.item.commentId.toString()] ?? false)
            BlocBuilder<ReplyCommentListBloc, ReplyCommentListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (comments) {
                    final replies = comments[widget.item.commentId] ?? [];
                    return ListView.separated(
                      key: ValueKey(widget.item.commentId),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = replies[index];
                        return CommentItemReplyCard(
                          onPressed: () {},
                          item: item,
                          postId: widget.postId,
                          parentCommentId: widget.item.commentId.toString(),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 6.h),
                      itemCount: replies.length,
                    );
                  },
                  orElse: () => Container(),
                );
              },
            ),
          //if (widget.item)

          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
