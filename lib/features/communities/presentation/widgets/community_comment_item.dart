import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_shimer.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_likes_bloc/community_comment_likes_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

class CommunityCommentItemCard extends StatefulWidget {
  final String avatar;
  final Comment item;
  final String postId;
  final String communityId;
  final String currentUid;

  const CommunityCommentItemCard({
    super.key,
    required this.avatar,
    required this.item,
    required this.postId,
    required this.communityId,
    required this.currentUid,
  });

  @override
  _CommunityCommentItemCardState createState() =>
      _CommunityCommentItemCardState();
}

class _CommunityCommentItemCardState extends State<CommunityCommentItemCard> {
  Map<String, bool> repliesVisibility = {};
  int likeCount = 0;
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLiked = widget.item.likes.contains(widget.currentUid);
      likeCount = widget.item.likes.length;
    });
  }

  void toggleIsLiked() {
    if (!isLiked) {
      context.read<CommunityCommentLikesBloc>().add(
            CommunityCommentLikesEvent.likesOfComment(
              isLiked: isLiked,
              communityId: widget.communityId,
              postId: widget.postId,
              commentId: widget.item.commentId,
              //subCommentId: widget.item.
            ),
          );
      likeCount += 1;
    } else {
      context.read<CommunityCommentLikesBloc>().add(
            CommunityCommentLikesEvent.likesOfComment(
              isLiked: isLiked,
              communityId: widget.communityId,
              postId: widget.postId,
              commentId: widget.item.commentId,
            ),
          );
      likeCount -= 1;
    }
    setState(() {
      isLiked = !isLiked;
    });
  }

  void getRepliesComment(String commentId) => {
        context.read<CommunityReplyCommentListBloc>().add(
              CommunityReplyCommentListEvent.getCommunityReplyComments(
                postId: widget.postId,
                parentCommentId: commentId,
                communityId: widget.communityId,
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
    return BlocListener<CommunityAddReplyCommentBloc,
        CommunityAddReplyCommentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (comment) {
            if (!(repliesVisibility[comment.parentCommentId] ?? false)) {
              setState(() {
                repliesVisibility[comment.parentCommentId!] = true;
              });
              getRepliesComment(comment.parentCommentId!);
              context.read<CommunityReplyCommentListBloc>().add(
                    CommunityReplyCommentListEvent.addNewCommunityComments(
                      comment,
                    ),
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
                    if (firebaseAuth.currentUser!.uid != widget.item.uid) {
                      context.push(
                        '/communities/community-profile/${widget.communityId}/community-detail/${widget.communityId}/${widget.postId}/profilePersonPage/${widget.item.uid}',
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
          if (repliesVisibility[widget.item.commentId.toString()] ?? false)
            BlocBuilder<CommunityReplyCommentListBloc,
                CommunityReplyCommentListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return ListView.separated(
                      key: ValueKey(widget.item.commentId),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
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
                    final replies = comments[widget.item.commentId] ?? [];
                    return ListView.separated(
                      key: ValueKey(widget.item.commentId),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          CommunityCommentItemReplyCard(
                        item: replies[index],
                        key: ValueKey(replies[index].commentId),
                        onPressed: () {},
                        parentCommentId: widget.item.commentId.toString(),
                        postId: widget.postId,
                        communityId: widget.communityId,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 6,
                      ),
                      itemCount: replies.length,
                    );
                  },
                  orElse: () => Container(),
                );
              },
            ),
          //if (widget.item)

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
