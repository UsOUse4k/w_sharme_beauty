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
import 'package:w_sharme_beauty/features/question/presentation/pages/sub_pages/add_question.dart';
import 'package:w_sharme_beauty/features/question/presentation/pages/sub_pages/my_questions.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/questions_list.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/questions_widget.dart';
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
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: Row(
          children: [
            BlocBuilder<MyProfileInfoBloc, MyProfileInfoState>(
              builder: (context, state) {
                return state.maybeWhen(
                  succes: (user) {
                    return user.profilePictureUrl != null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: GlCachedNetworImage(
                              height: 26.h,
                              width: 26.w,
                              urlImage: user.profilePictureUrl,
                            ),
                          )
                        : GlCircleAvatar(
                            avatar: Assets.images.notAvatar.path,
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
            SearchWidget(
              onChanged: (value) {
                context
                    .read<GetAllQuestionBloc>()
                    .add(GetAllQuestionEvent.searchQuestion(value: value));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuestionsWidget(
                  wrapText: 'Мои вопросы',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyQuestions(),
                      ),
                    );
                  },
                ),
                QuestionsWidget(
                  wrapText: 'Мои ответы',
                  onTap: () {},
                ),
                QuestionsWidget(
                  wrapText: 'Задать вопрос',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddQuestion(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Категории",
              style: AppStyles.w400f14.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (categories) {
                    return CategoryList(
                      category: categories,
                      onFilterCategories: (value) {
                        context.read<GetAllQuestionBloc>().add(
                              GetAllQuestionEvent.filterQuestion(
                                title: value.title!,
                              ),
                            );
                      },
                    );
                  },
                  orElse: () => Container(),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<GetAllQuestionBloc, GetAllQuestionState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const SizedBox(),
                  success: (questions) {
                    return QuestionsList(questions: questions);
                  },
                  orElse: () => const SizedBox(),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
