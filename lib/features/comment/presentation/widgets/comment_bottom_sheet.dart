import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/text_field_send_message_widget.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/parent_id.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({
    super.key,
    required this.postId,
    this.communityId,
  });

  final String postId;
  final String? communityId;

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.8,
      expand: false,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.6,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Container(
                        height: 2,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Коментарии',
                        style: AppStyles.w400f16.copyWith(),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.communityId == null)
                CommentList(
                  postId: widget.postId,
                )
              else
                CommunityCommentList(
                  postId: widget.postId,
                  communityId: widget.communityId.toString(),
                ),
              BlocBuilder<ParentCommentIdBloc, ParentIdUsername?>(
                builder: (context, state) {
                  if (state != null && state.username != '') {
                    commentController.text = state.username.toString();
                  }
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      children: [
                        if (state != null && state.id != '')
                          Container(
                            height: 50,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 5,
                            ),
                            decoration: const BoxDecoration(
                              color: AppColors.lightGrey,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state.username.toString()),
                                GestureDetector(
                                  onTap: () {
                                    commentController.clear();
                                    context.read<ParentCommentIdBloc>().add(
                                          const ParentCommentIdEvent
                                              .addParentCommentId('', ''),
                                        );
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 5.h),
                        TextFieldSendMessageWidget(
                          show: 'show',
                          controller: commentController,
                          onPressed: () {
                            if (commentController.text.isNotEmpty) {
                              if (state != null && state.id != '') {
                                if (widget.communityId != null) {
                                  context
                                      .read<CommunityAddReplyCommentBloc>()
                                      .add(
                                        CommunityAddReplyCommentEvent
                                            .addReplyComment(
                                          Comment(
                                            comment: commentController.text,
                                          ),
                                          state.id.toString(),
                                          widget.postId,
                                          widget.communityId!,
                                        ),
                                      );
                                } else {
                                  context.read<AddReplyCommentBloc>().add(
                                        AddReplyCommentEvent.addReplyComment(
                                          Comment(
                                            comment: commentController.text,
                                          ),
                                          state.id.toString(),
                                          widget.postId,
                                        ),
                                      );
                                }
                              } else {
                                if (widget.communityId != null) {
                                  context
                                      .read<CommunityCommentCreateBloc>()
                                      .add(
                                        CommunityCommentCreateEvent.addComment(
                                          Comment(
                                            comment: commentController.text,
                                          ),
                                          widget.postId,
                                          widget.communityId!,
                                        ),
                                      );
                                } else {
                                  context.read<CommentCreateBloc>().add(
                                        CommentCreateEvent.addComment(
                                          Comment(
                                            comment: commentController.text,
                                          ),
                                          widget.postId,
                                        ),
                                      );
                                }
                              }
                            }
                            commentController.clear();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
