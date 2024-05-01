// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  List<String> selectedImagePaths = [];
  bool isLoading = false;
  final TextEditingController desc = TextEditingController();

  Future pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImagePaths.add(image.path);
      });
    }
  }

  void clearImage(String path) {
    setState(() {
      selectedImagePaths.remove(path);
    });
  }

  @override
  void dispose() {
    desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        title: CenterTitleAppBar(
          title: 'Публикация',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: BlocListener<PostCreateBloc, PostCreateState>(
        listener: (context, state) {
          state.maybeMap(
            loading: (value) {
              setState(() {
                isLoading = true;
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
            success: (value) {
              context
                  .read<MyPostListBloc>()
                  .add(MyPostListEvent.addNewPost(value.post));

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Загрузка успешно завершена!"),
                ),
              );

              setState(() {
                selectedImagePaths = [];
                desc.clear();
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
              height: 10,
            ),
            Text(
              "Выберите фото или видео",
              style: AppStyles.w500f16.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: selectedImagePaths
                  .map(
                    (path) => CardImageProfileAdd(
                      image: FileImage(File(path)),
                      onPressed: () => clearImage(path),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            AddingButton(
              text: "+ Выбрать из галереи",
              onPressed: () => pickImage(context),
            ),
            const SizedBox(height: 20),
            TextFieldWidgetWithTitle(
              controller: desc,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              title: "Описание",
              titleStyle: AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
              hintText: "Напишите сообщение",
            ),
            const Spacer(),
            GlButton(
              text: isLoading ? "Загрузка.." : "Опубликовать",
              onPressed: () {
                if (selectedImagePaths.isNotEmpty && desc.text.isNotEmpty) {
                  context.read<PostCreateBloc>().add(
                        PostCreateEvent.createPost(
                          Post(
                            text: desc.text,
                            imageUrls: selectedImagePaths,
                          ),
                        ),
                      );
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
