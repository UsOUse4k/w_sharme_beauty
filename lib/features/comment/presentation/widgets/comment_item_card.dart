import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_likes_bloc/comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/reply_comment_list_bloc/reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_shimer.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

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
  int likeCount = 0;
  bool isLiked = false;
  Map<String, bool> repliesVisibility = {};

  @override
  void initState() {
    super.initState();
    //getRepliesComment(widget.item.commentId.toString());
    setState(() {
      isLiked = widget.item.likes.contains(firebaseAuth.currentUser!.uid);
      likeCount = widget.item.likes.length;
      repliesVisibility[widget.item.commentId.toString()] = false;
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

  void getRepliesComment(String commentId) => {
    //print(commentId)
        context.read<ReplyCommentListBloc>().add(
              ReplyCommentListEvent.getReplyComments(
                postId: widget.postId,
                parentCommentId: commentId,
              ),
            ),
      };

  void toggleRepliesVisibility(String commentId) {
    setState(() {
      repliesVisibility[commentId] = !repliesVisibility[commentId]!;
      if (repliesVisibility[commentId] ?? false) {
        getRepliesComment(commentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = widget.item.createdAt!;
    final String formattedDate = formatDateTime(timestamp);
    return BlocListener<AddReplyCommentBloc, AddReplyCommentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (comment) {
            context
                .read<ReplyCommentListBloc>()
                .add(ReplyCommentListEvent.addNewComments(comment));
            context
                .read<ParentCommentIdBloc>()
                .add(const ParentCommentIdEvent.addParentCommentId('', ''));
            context.read<PostListBloc>().add(const PostListEvent.getPosts());
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
                    context.push(
                      '/home/${RouterContants.profilePersonPage}/${widget.item.uid}',
                    );
                  },
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
              ),
              Flexible(
                flex: 8,
                child: Column(
                  children: [
                    CommentItemText(
                      key: ValueKey(widget.item.commentId),
                      username: widget.item.username ?? '',
                      comment: widget.item.comment ?? '',
                      data: formattedDate,
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
          if (repliesVisibility[widget.item.commentId.toString()] ?? false)
            BlocBuilder<ReplyCommentListBloc, ReplyCommentListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => const CommentShimer(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 6,
                      ),
                      itemCount: state.maybeWhen(
                        orElse: () => 0,
                        success: (comments) => comments.length,
                      ),
                    );
                  },
                  success: (comments) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = comments[index];
                        return CommentItemReplyCard(
                          onPressed: () {},
                          item: item,
                          postId: widget.postId,
                          key: ValueKey(item.commentId),
                          parentCommentId: widget.item.commentId.toString(),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 6,
                      ),
                      itemCount: comments.length,
                    );
                  },
                  orElse: () => Container(),
                );
              },
            ),
          //if (widget.item)
          if (widget.item.replies != 0)
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 25),
              child: InkWell(
                onTap: () =>
                    toggleRepliesVisibility(widget.item.commentId.toString()),
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
                      repliesVisibility[widget.item.commentId.toString()] ??
                              false
                          ? 'Скрыть ответы'
                          : 'Смотреть  ${widget.item.replies} ответов',
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
