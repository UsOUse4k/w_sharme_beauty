import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/parent_id.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_add_reply_comment_bloc/community_add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_create_bloc/community_comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_comment_list_bloc/community_comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_detail_bloc/community_post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/username_reply_comment_widget.dart';

class CommunityPostDetailPage extends StatefulWidget {
  const CommunityPostDetailPage({
    super.key,
    this.postId,
    this.communityId,
  });

  final String? postId;
  final String? communityId;

  @override
  State<CommunityPostDetailPage> createState() =>
      _CommunityPostDetailPageState();
}

class _CommunityPostDetailPageState extends State<CommunityPostDetailPage> {
  final TextEditingController comment = TextEditingController();

  @override
  void initState() {
    context.read<CommunityPostDetailBloc>().add(
          CommunityPostDetailEvent.getPost(
            communityId: widget.communityId.toString(),
            postId: widget.postId.toString(),
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Запись',
          textStyle: AppStyles.w500f22,
          key: ValueKey(widget.postId),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<CommunityPostDetailBloc, CommunityPostDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (post) {
                
                context.read<CommunityCommentListBloc>().add(
                      CommunityCommentListEvent.getCommunityComments(
                        postId: widget.postId.toString(),
                        communityId: widget.communityId.toString(),
                      ),
                    );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.purple,
                ),
              ),
              error: (message) => Center(
                child: Text(message),
              ),
              success: (post) {
                return BlocListener<CommunityCommentCreateBloc,
                    CommunityCommentCreateState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: (comment) {
                        context.read<CommunityCommentListBloc>().add(
                              CommunityCommentListEvent.addCommunityNewComments(
                                comment,
                              ),
                            );
                      },
                      orElse: () {},
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: [
                              BlocBuilder<CommunityDetailBloc,
                                  CommunityDetailState>(
                                builder: (context, state) {
                                  return CommunityPostCard(
                                    onPressedDetailPost: () {
                                      
                                    },
                                    show: 'show',
                                    onPressed: () {},
                                    post: post,
                                    communityName: state.maybeWhen(
                                      orElse: () => '',
                                      success: (community) =>
                                          community.communityName.toString(),
                                    ),
                                    avatarUrl: state.maybeWhen(
                                      orElse: () => '',
                                      success: (community) =>
                                          community.avatarUrls.toString(),
                                    ),
                                    communityId: state.maybeWhen(
                                      orElse: () => '',
                                      success: (community) =>
                                          community.communityId.toString(),
                                    ),
                                  );
                                },
                              ),
                              CustomContainer(
                                child: BlocBuilder<CommunityCommentListBloc,
                                    CommunityCommentListState>(
                                  builder: (context, state) {
                                    return state.maybeWhen(
                                      success: (comments) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${post.commentsCount} Ответа',
                                              style: AppStyles.w500f14.copyWith(
                                                color: AppColors.darkGrey,
                                              ),
                                            ),
                                            SizedBox(height: 15.h),
                                            CommunityCommentList(
                                              comments: comments,
                                              postId: post.postId.toString(),
                                              communityId:
                                                  widget.communityId.toString(),
                                            ),
                                          ],
                                        );
                                      },
                                      orElse: () => Container(),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<ParentCommentIdBloc, ParentIdUsername?>(
                        builder: (context, state) {
                          if (state != null && state.username != '') {
                            comment.text = "${state.username} -> ";
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (state != null && state.id != '')
                                UsernameReplyCommentWidget(
                                  username: state.username.toString(),
                                  controller: comment,
                                ),
                              TextFieldSendMessageWidget(
                                controller: comment,
                                show: 'show',
                                onPressed: () {
                                  if (comment.text.isNotEmpty) {
                                    if (state != null && state.id != '') {
                                      context
                                          .read<CommunityAddReplyCommentBloc>()
                                          .add(
                                            CommunityAddReplyCommentEvent
                                                .addReplyComment(
                                              Comment(
                                                comment: comment.text,
                                              ),
                                              state.id.toString(),
                                              widget.postId.toString(),
                                              widget.communityId!,
                                            ),
                                          );
                                    } else {
                                      context
                                          .read<CommunityCommentCreateBloc>()
                                          .add(
                                            CommunityCommentCreateEvent
                                                .addComment(
                                              Comment(
                                                comment: comment.text,
                                              ),
                                              widget.postId.toString(),
                                              widget.communityId!,
                                            ),
                                          );
                                    }
                                    comment.clear();
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
