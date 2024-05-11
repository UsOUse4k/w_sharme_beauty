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
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart';
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
  bool _isRepliesVisible = false;
  int likeCount = 0;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _isRepliesVisible = widget.item.replies == 1;
    if (_isRepliesVisible) {
      getRepliesComment();
    }
    setState(() {
      
      isLiked = widget.item.likes.contains(firebaseAuth.currentUser!.uid);
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
    final Timestamp timestamp = widget.item.createdAt!;
    final String formattedDate = formatDateTime(timestamp);
    return BlocListener<AddReplyCommentBloc, AddReplyCommentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (comment) {
            context.read<ReplyCommentListBloc>().add(
                  ReplyCommentListEvent.getReplyComments(
                    postId: widget.postId,
                    parentCommentId: widget.item.commentId.toString(),
                  ),
                );
            context
                .read<ParentCommentIdBloc>()
                .add(const ParentCommentIdEvent.addParentCommentId('', ''));
            context.read<PostListBloc>().add(const PostListEvent.getPosts());
            context
                .read<CommentListBloc>()
                .add(CommentListEvent.getComments(postId: widget.postId));
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
                    context.push('/home/${RouterContants.profilePersonPage}/${widget.item.uid}');
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
                  loading: () {
                    return ListView.separated(
                      itemBuilder: (context, index) => const CommentShimer(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 6,
                      ),
                      itemCount: 8,
                    );
                  },
                  success: (replies) {
                    return Column(
                      children: replies.map((reply) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: CommentItemReplyCard(
                            onPressed: () {},
                            item: reply,
                            postId: widget.postId,
                            parentCommentId: widget.item.commentId.toString(),
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
          if (widget.item.replies != 0)
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
                      _isRepliesVisible
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
