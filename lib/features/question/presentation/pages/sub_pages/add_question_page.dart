import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/filter_button_widget.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/filter_radio_widget.dart';
import 'package:w_sharme_beauty/features/profile/data/local_category_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/add_question_bloc.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/get_all_question_bloc/get_all_question_bloc.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final TextEditingController _themeCtrl = TextEditingController();
  final TextEditingController _categoryCtrl = TextEditingController();
  final TextEditingController _questionCtrl = TextEditingController();

  bool agreedToTerms = false;
  bool isLoading = false;
  String filterText = 'Категория';
  String? selectedCategory;

  @override
  void dispose() {
    _themeCtrl.dispose();
    _categoryCtrl.dispose();
    _questionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 16),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Задать вопрос',
          style: AppStyles.w500f18,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<AddQuestionBloc, AddQuestionState>(
          listener: (context, state) {
            state.maybeMap(
              loading: (value) {
                setState(() {
                  isLoading = true;
                });
              },
              success: (value) {
                context.read<GetAllQuestionBloc>().add(
                      GetAllQuestionEvent.addNewQuestion(
                        question: value.question,
                      ),
                    );
                context.pop();
                setState(() {
                  _questionCtrl.clear();
                  _themeCtrl.clear();
                  _categoryCtrl.clear();
                  isLoading = false;
                });
              },
              error: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Ошибка: ${value.message}"),
                  ),
                );
                setState(() {
                  isLoading = false;
                });
              },
              orElse: () {},
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFieldWidgetWithTitle(
                title: "Тема вопроса",
                hintText: "Придумайте тему вопросы",
                controller: _themeCtrl,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Выберите категорию',
                  style: AppStyles.w500f16.copyWith(
                    color: AppColors.darkGrey,
                  ),
                ),
              ),
              FilterButtonWidget(
                width: 394.w,
                onPressed: () => BottomSheetUtil.showAppBottomSheet(
                  context,
                  CustomBottomSheet(
                    maxHeight: 0.55,
                    navbarTitle: 'Категория',
                    widget: RadioFilterWidget(
                      list: categoryList,
                      onSelect: (String text) {
                        filterText = text;
                        selectedCategory = text;
                        setState(() {});
                      },
                      selectedValue: selectedCategory ?? '',
                    ),
                  ),
                ),
                title: filterText,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidgetWithTitle(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                title: "Текст вопроса",
                titleStyle:
                    AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
                hintText: "Расскажите о вопросе подробнее",
                controller: _questionCtrl,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: AppColors.purple,
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: AppColors.purple,
                      ),
                    ),
                    value: agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreedToTerms = value!;
                      });
                    },
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Задать вопрос анонимно',
                          style: const TextStyle(
                            color: AppColors.purple,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.purple,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (_themeCtrl.text.isNotEmpty &&
                      selectedCategory != null &&
                      _questionCtrl.text.isNotEmpty) {
                    context.read<AddQuestionBloc>().add(
                          AddQuestionEvent.addedQuestion(
                            question: Question(
                              theme: _themeCtrl.text,
                              category: selectedCategory,
                              questionText: _questionCtrl.text,
                            ),
                            isAnonymous: agreedToTerms,
                          ),
                        );
                  } else {
                    showMyDialog(context, 'Пополните все поля');
                  }
                },
                child: Text(
                  isLoading ? "Загрузка.." : "Опубликовать вопрос",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
