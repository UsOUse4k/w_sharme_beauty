import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/create_notification_bloc/create_notification_bloc.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_notification_bloc/get_all_notification_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/parent_id.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/add_reply_comment/add_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_create_bloc/comment_create_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/comment_list_bloc/comment_list_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/comment/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_detail_bloc/post_detail_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/username_reply_comment_widget.dart';

class HomePostPage extends StatefulWidget {
  const HomePostPage({
    super.key,
    this.postId,
  });

  final String? postId;

  @override
  State<HomePostPage> createState() => _HomePostPageState();
}

class _HomePostPageState extends State<HomePostPage> {
  final TextEditingController comment = TextEditingController();

  @override
  void initState() {
    context.read<PostDetailBloc>().add(PostDetailEvent.getPost(widget.postId!));
    super.initState();
  }

  @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUid = firebaseAuth.currentUser!.uid;
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
        child: BlocConsumer<PostDetailBloc, PostDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (post) {
                context.read<CommentListBloc>().add(
                      CommentListEvent.getComments(
                        postId: post.postId.toString(),
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
              error: (message) => const Center(
                child: Text('not post found'),
              ),
              success: (post) {
                return BlocListener<CommentCreateBloc, CommentCreateState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: (comment) {
                        context
                            .read<CommentListBloc>()
                            .add(CommentListEvent.addNewComments(comment));
                        if (post.authorId != currentUid) {
                          context.read<CreateNotificationBloc>().add(
                                CreateNotificationEvent.created(
                                  type: 'comment',
                                  fromUser: post.authorId.toString(),
                                  contentId: post.postId.toString(),
                                ),
                              );
                        }
                      },
                      orElse: () {},
                    );
                  },
                  child: BlocListener<CreateNotificationBloc,
                      CreateNotificationState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: (notification) {
                          context.read<GetAllNotificationBloc>().add(
                                GetAllNotificationEvent.addNewNotification(
                                  notification: notification,
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
                                PostCard(
                                  show: 'show',
                                  onPressed: () {},
                                  onPressedDetailPage: () {},
                                  showButton: true,
                                  post: post,
                                ),
                                CustomContainer(
                                  child: BlocBuilder<CommentListBloc,
                                      CommentListState>(
                                    builder: (context, state) {
                                      return state.maybeWhen(
                                        success: (comments) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${post.commentsCount} Ответа',
                                                style:
                                                    AppStyles.w500f14.copyWith(
                                                  color: AppColors.darkGrey,
                                                ),
                                              ),
                                              SizedBox(height: 15.h),
                                              CommentList(
                                                comments: comments,
                                                postId: post.postId.toString(),
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
                                        context.read<AddReplyCommentBloc>().add(
                                              AddReplyCommentEvent
                                                  .addReplyComment(
                                                Comment(
                                                  comment: comment.text,
                                                ),
                                                state.id.toString(),
                                                widget.postId.toString(),
                                              ),
                                            );
                                      } else {
                                        context.read<CommentCreateBloc>().add(
                                              CommentCreateEvent.addComment(
                                                Comment(
                                                  comment: comment.text,
                                                ),
                                                widget.postId.toString(),
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
