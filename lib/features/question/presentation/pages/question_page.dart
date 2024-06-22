import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_list.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';

import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart';

import 'package:w_sharme_beauty/features/question/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/wigets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    context
        .read<GetAllQuestionBloc>()
        .add(const GetAllQuestionEvent.getAllQuestions());

    context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlAppBar(
        leading: Row(
          children: [
            BlocBuilder<MyProfileInfoBloc, MyProfileInfoState>(
              builder: (context, state) {
                return state.maybeWhen(
                  succes: (user) {
                    return GlCircleAvatar(
                      avatar: user.profilePictureUrl.toString(),
                      width: 26.w,
                      height: 26.h,
                    );
                  },
                  orElse: () => Container(),
                );
              },
            ),
            const SizedBox(width: 16),
            Text(
              'Вопросы и ответы',
              style: AppStyles.w500f22,
            ),
          ],
        ),
        action: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Assets.icons.bell.image(
                width: 26,
                height: 26,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: const BoxDecoration(color: AppColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(
                    onChanged: (value) {
                      context.read<GetAllQuestionBloc>().add(
                            GetAllQuestionEvent.searchQuestion(value: value),
                          );
                    },
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuestionsWidget(
                        wrapText: 'Мои вопросы',
                        onTap: () {
                          context
                              .read<GetAllQuestionBloc>()
                              .add(const GetAllQuestionEvent.myQuestions());
                        },
                      ),
                      QuestionsWidget(
                        wrapText: 'Мои ответы',
                        onTap: () {
                          context
                              .read<GetAllQuestionBloc>()
                              .add(const GetAllQuestionEvent.myAnswers());
                        },
                      ),
                      QuestionsWidget(
                        wrapText: 'Задать вопрос',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddQuestionPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Категории",
                    style: AppStyles.w500f18.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        error: (message) {
                          return Container();
                        },
                        success: (categories) {
                          return CategoryList(
                            category: categories,
                            onFilterCategories: (value) {
                              if (value != null) {
                                context.read<GetAllQuestionBloc>().add(
                                      GetAllQuestionEvent.filterQuestion(
                                        title: value.title!,
                                      ),
                                    );
                              } else {
                                context.read<GetAllQuestionBloc>().add(
                                      const GetAllQuestionEvent
                                          .getAllQuestions(),
                                    );
                              }
                            },
                          );
                        },
                        orElse: () => Container(),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            BlocBuilder<GetAllQuestionBloc, GetAllQuestionState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (questions) {
                    return QuestionsList(questions: questions);
                  },
                  orElse: () => const SizedBox(),
                );
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
