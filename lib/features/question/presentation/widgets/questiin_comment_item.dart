import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/comment_item_text.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_reply_comment_bloc/create_question_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_comment_like_bloc/question_comment_like_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/question_get_all_reply_comment_bloc/question_get_all_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/question_comment_reply_item.dart';

class QuestionCommentItem extends StatefulWidget {
  const QuestionCommentItem({
    super.key,
    required this.onPressed,
    required this.item,
    required this.questionId,
  });

  final Function() onPressed;
  final Comment item;
  final String questionId;

  @override
  State<QuestionCommentItem> createState() => _QuestionCommentItemState();
}

class _QuestionCommentItemState extends State<QuestionCommentItem> {
  bool isLiked = false;
  int likeCount = 0;
  Map<String, bool> repliesVisibility = {};
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
              commentId: widget.item.commentId,
              questionId: widget.questionId,
            ),
          );
      likeCount += 1;
    } else {
      context.read<QuestionCommentLikeBloc>().add(
            QuestionCommentLikeEvent.likeComment(
              isLiked: isLiked,
              commentId: widget.item.commentId,
              questionId: widget.questionId,
            ),
          );
      likeCount -= 1;
    }
    setState(() {
      isLiked = !isLiked;
    });
  }

  void getRepliesComment(String commentId) => {
        context.read<QuestionGetAllReplyCommentBloc>().add(
              QuestionGetAllReplyCommentEvent.getReplyComments(
                questionId: widget.questionId,
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
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: BlocListener<CreateQuestionReplyCommentBloc,
          CreateQuestionReplyCommentState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (comment) {
              if (!(repliesVisibility[comment.parentCommentId] ?? false)) {
                setState(() {
                  repliesVisibility[comment.parentCommentId!] = true;
                });
                getRepliesComment(comment.parentCommentId!);
                context.read<QuestionGetAllReplyCommentBloc>().add(
                      QuestionGetAllReplyCommentEvent.addNewComments(comment),
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
                      if (widget.item.avatarUrl != '') {
                        if (currentUid != widget.item.uid) {
                          context.push(
                            '/question/question-datail/${widget.questionId}/profilePersonPage/${widget.item.uid}',
                          );
                        }
                      }
                    },
                    child: GlCircleAvatar(
                      avatar: widget.item.avatarUrl ?? '',
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
              BlocBuilder<QuestionGetAllReplyCommentBloc,
                  QuestionGetAllReplyCommentState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (comments) {
                      final replies = comments[widget.item.commentId] ?? [];
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = replies[index];
                          return QuestionCommentReplyItem(
                            onPressed: () {},
                            item: item,
                            parentCommentId: widget.item.commentId.toString(),
                            questionId: widget.questionId,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                        itemCount: replies.length,
                      );
                    },
                    orElse: () => Container(),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
