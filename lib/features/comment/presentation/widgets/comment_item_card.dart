import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/widgets.dart';

class CommentItemCard extends StatefulWidget {
  final String avatar;
  final Comment item;
  final String postId;
  const CommentItemCard({
    super.key,
    required this.avatar,
    required this.item,
    required this.postId,
  });

  @override
  _CommentItemCardState createState() => _CommentItemCardState();
}

class _CommentItemCardState extends State<CommentItemCard> {
  bool _isRepliesVisible = false;
  int likeCount = 0;
  bool isLiked = false;
  int replyCommentsLength = 0;

  @override
  void initState() {
    super.initState();
    if (_isRepliesVisible) {
      getRepliesComment();
    }
    setState(() {
      isLiked = widget.item.likes.contains(widget.item.uid);
      likeCount = widget.item.likes.length;
    });
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

  void getRepliesComment() => {
        if (widget.item.commentId != null)
          {
            context.read<ReplyCommentListBloc>().add(
                  ReplyCommentListEvent.getReplyComments(
                    postId: widget.postId,
                    parentCommentId: widget.item.commentId.toString(),
                  ),
                ),
          },
      };

  void _toggleReplies() {
    setState(() {
      _isRepliesVisible = !_isRepliesVisible;
    });
    if (_isRepliesVisible) {
      getRepliesComment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: GlCachedNetworImage(
                  height: 40.h,
                  width: 40.w,
                  urlImage: widget.avatar,
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Column(
                children: [
                  CommentItemText(
                    username: widget.item.username ?? '',
                    comment: widget.item.comment ?? '',
                    data: 'сегодня в 15:53',
                    like: '$likeCount',
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
        if (_isRepliesVisible)
          BlocConsumer<ReplyCommentListBloc, ReplyCommentListState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (comments) {
                  _isRepliesVisible = true;
                  setState(() {});
                },
                error: (error) {
                  _isRepliesVisible = false;
                  setState(() {});
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                success: (replies) {
                  return Column(
                    children: replies.map((reply) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: CommentItemReplyCard(
                          onPressed: () {},
                          item: reply,
                        ),
                      );
                    }).toList(),
                  );
                },
                orElse: () => Container(),
              );
            },
          ),
        //if (widget.item)
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 25),
          child: InkWell(
            onTap: _toggleReplies,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 2,
                  decoration: const BoxDecoration(
                    color: AppColors.lightGrey,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _isRepliesVisible ? 'Скрыть ответы' : 'Смотреть  $replyCommentsLength ответов',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
