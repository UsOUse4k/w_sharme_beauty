import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/comment.dart';
import 'package:w_sharme_beauty/features/comment/domain/entities/parent_id.dart';
import 'package:w_sharme_beauty/features/comment/presentation/bloc/parent_comment_id_bloc/parent_comment_id_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_comment_bloc/create_question_comment_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/create_question_reply_comment_bloc/create_question_reply_comment_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_comments_bloc/get_all_question_comments_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_question_bloc/get_question_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/question_comment_list.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/username_reply_comment_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class QuestionDetailPage extends StatefulWidget {
  const QuestionDetailPage({super.key, required this.questionId});
  final String questionId;

  @override
  State<QuestionDetailPage> createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  final TextEditingController _messageCtrl = TextEditingController();

  @override
  void initState() {
    context
        .read<GetQuestionBloc>()
        .add(GetQuestionEvent.getQuestion(questionId: widget.questionId));
    super.initState();
  }

  @override
  void dispose() {
    _messageCtrl.dispose();
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
          title: 'Вопросы',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<GetQuestionBloc, GetQuestionState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (question) {
                context.read<GetAllQuestionCommentsBloc>().add(
                      GetAllQuestionCommentsEvent.getAllComments(
                        questionId: question.questionId.toString(),
                      ),
                    );
              },
              orElse: () => Container(),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              success: (question) {
                final formattedDate = formatDateTime(question.createdAt!);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 10,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          CustomContainer(
                            marginTop: 15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: question.avatarUrl != null
                                      ? GestureDetector(
                                          onTap: () {
                                            if (question.username != 'Анонимно') {
                                              if (question.uid != currentUid) {
                                                context.push(
                                                  '/question/question-datail/${widget.questionId}/profilePersonPage/${question.uid}',
                                                );
                                              }
                                            }
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(25),
                                            ),
                                            child: GlCachedNetworImage(
                                              key:
                                                  ValueKey(question.questionId),
                                              urlImage: question.avatarUrl,
                                              width: 50.w,
                                              height: 50.h,
                                            ),
                                          ),
                                        )
                                      : GlCircleAvatar(
                                          avatar: Assets.images.notAvatar.path,
                                          width: 50.w,
                                          height: 50.h,
                                        ),
                                  title: Text(
                                    question.username.toString(),
                                    style: AppStyles.w500f16,
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        formattedDate,
                                        style: AppStyles.w400f14.copyWith(
                                          color: AppColors.darkGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${question.questionText}',
                                  style: AppStyles.w400f16,
                                ),
                              ],
                            ),
                          ),
                          CustomContainer(
                            marginBottom: 14,
                            marginTop: 14,
                            child: BlocBuilder<GetAllQuestionCommentsBloc,
                                GetAllQuestionCommentsState>(
                              builder: (context, state) {
                                return state.maybeWhen(
                                  success: (comments) {
                                    return BlocListener<
                                        CreateQuestionCommentBloc,
                                        CreateQuestionCommentState>(
                                      listener: (context, state) {
                                        state.maybeWhen(
                                          success: (comment) {
                                            context
                                                .read<
                                                    GetAllQuestionCommentsBloc>()
                                                .add(
                                                  GetAllQuestionCommentsEvent
                                                      .addNewComments(comment),
                                                );
                                          },
                                          orElse: () {},
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${question.countOutput} Ответа',
                                            style: AppStyles.w500f14.copyWith(
                                              color: AppColors.darkGrey,
                                            ),
                                          ),
                                          SizedBox(height: 15.h),
                                          QuestionCommentList(
                                            comments: comments,
                                            questionId:
                                                question.questionId.toString(),
                                          ),
                                        ],
                                      ),
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
                    BlocBuilder<ParentCommentIdBloc, ParentIdUsername?>(
                      builder: (context, parentState) {
                        if (parentState != null && parentState.username != '') {
                          _messageCtrl.text = '${parentState.username} -> ';
                        }
                        return Column(
                          children: [
                            if (parentState != null && parentState.id != '')
                              UsernameReplyCommentWidget(
                                username: parentState.username.toString(),
                                controller: _messageCtrl,
                              ),
                            SizedBox(height: 5.h),
                            TextFieldSendMessageWidget(
                              controller: _messageCtrl,
                              show: 'show',
                              onPressed: () {
                                if (_messageCtrl.text.isNotEmpty) {
                                  if (parentState != null &&
                                      parentState.id != '') {
                                    context
                                        .read<CreateQuestionReplyCommentBloc>()
                                        .add(
                                          CreateQuestionReplyCommentEvent
                                              .createReplyComment(
                                            questionId: widget.questionId,
                                            comment: Comment(
                                              comment: _messageCtrl.text,
                                            ),
                                            parentCommentId:
                                                parentState.id.toString(),
                                            avatarUrl:
                                                question.avatarUrl.toString(),
                                            authorId: question.uid.toString(),
                                          ),
                                        );
                                  } else {
                                    context
                                        .read<CreateQuestionCommentBloc>()
                                        .add(
                                          CreateQuestionCommentEvent
                                              .createComment(
                                            questionId: widget.questionId,
                                            comment: Comment(
                                              comment: _messageCtrl.text,
                                            ),
                                            avatarUrl:
                                                question.avatarUrl.toString(),
                                            authorId: question.uid.toString(),
                                          ),
                                        );
                                  }
                                  _messageCtrl.clear();
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
