import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/text_field_widget_with_title.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/question/presentation/bloc/add_question_bloc/question_bloc.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  List<Uint8List> selectedImageBytes = [];

  final TextEditingController _themeCtrl = TextEditingController();
  final TextEditingController _categoryCtrl = TextEditingController();
  final TextEditingController _questionCtrl = TextEditingController();

  bool agreedToTerms = false;
  bool isLoading = false;
  Uint8List? avatar;

  Future pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final Uint8List imageData = await image.readAsBytes();
      setState(() {
        selectedImageBytes.add(imageData);
      });
    }
  }

  void clearImage(Uint8List bytes) {
    setState(() {
      selectedImageBytes.removeWhere((element) => element == bytes);
    });
  }

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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Задать вопрос',
          style: AppStyles.w500f18,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocListener<QuestionBloc, QuestionState>(
          listener: (context, state) {
            state.maybeMap(
              loading: (value) {
                setState(() {
                  isLoading = true;
                });
              },
              success: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Загрузка успешно завершена!"),
                  ),
                );
                setState(() {
                  selectedImageBytes = [];
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
              TextFieldWidgetWithTitle(
                title: "Выберите категорию",
                hintText: "Выберите категорию",
                controller: _categoryCtrl,
                suffixIcon: const Icon(
                  Icons.expand_more_outlined,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Прикрипеть фото",
                    style: AppStyles.w400f14.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (avatar != null)
                    CardImageProfileAdd(
                      radius: 50,
                      image: MemoryImage(avatar!),
                      onPressed: () {
                        avatar = null;
                        setState(() {});
                      },
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  AddingButton(
                    text: '+ Выбрать фото',
                    onPressed: () {
                      pickImage(context);
                    },
                  ),
                ],
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
                      _categoryCtrl.text.isNotEmpty &&
                      _questionCtrl.text.isNotEmpty) {
                    context.read<QuestionBloc>().add(
                          QuestionEvent.addedQuestion(
                            question: Question(
                              theme: _themeCtrl.text,
                              category: _categoryCtrl.text,
                              questionText: _questionCtrl.text,
                              //imageUrl: 'https://example.com/',
                            ),
                            isAnonymous: agreedToTerms,
                          ),
                        );
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
