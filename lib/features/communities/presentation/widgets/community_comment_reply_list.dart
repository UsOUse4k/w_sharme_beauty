import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_shimer.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_reply_comment_lidt_bloc/community_reply_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/community_comment_reply_item.dart';

class CommunityCommentReplyList extends StatefulWidget {
  const CommunityCommentReplyList({
    super.key,
    required this.postId,
    required this.communityId,
    required this.item,
  });
  final String postId;
  final String communityId;
  final Comment item;

  @override
  State<CommunityCommentReplyList> createState() =>
      _CommunityCommentReplyListState();
}

class _CommunityCommentReplyListState extends State<CommunityCommentReplyList> {
  Map<String, bool> repliesVisibility = {};
  @override
  void initState() {
    super.initState();
    setState(() {
      repliesVisibility[widget.item.commentId.toString()] = false;
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
    setState(() {
      repliesVisibility[commentId] = !repliesVisibility[commentId]!;
      if (repliesVisibility[commentId] ?? false) {
        getRepliesComment(commentId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    itemCount: 8,
                  );
                },
                success: (comments) {
                  return ListView.separated(
                    key: ValueKey(widget.item.commentId),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        CommunityCommentItemReplyCard(
                      item: comments[index],
                      key: ValueKey(comments[index].commentId),
                      onPressed: () {},
                      parentCommentId: widget.item.commentId.toString(),
                      postId: widget.postId,
                      communityId: widget.communityId,
                    ),
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
                    repliesVisibility[widget.item.commentId.toString()] ?? false
                        ? 'Скрыть ответы'
                        : 'Смотреть  ${widget.item.replies} ответов',
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
