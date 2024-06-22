// ignore_for_file: use_build_context_synchronously
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/filter_button_widget.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/filter_radio_widget.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/my_post_list_bloc/my_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_create_bloc/post_create_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/post_list_bloc/post_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/data/local_category_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController desc = TextEditingController();
  List<Uint8List> selectedImageBytes = [];
  bool isLoading = false;
  String filterText = 'Категория';
  String? selectedCategory;

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
    desc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
            success: (value) {
              context
                  .read<PostListBloc>()
                  .add(PostListEvent.addNewPost(value.post));
              context
                  .read<MyPostListBloc>()
                  .add(MyPostListEvent.addNewPost(value.post));
              context.go('/home');
              setState(() {
                selectedImageBytes = [];
                desc.clear();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Выберите фото или видео",
                style: AppStyles.w500f14.copyWith(color: AppColors.darkGrey),
              ),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: selectedImageBytes.map((bytes) {
                  return CardImageProfileAdd(
                    image: MemoryImage(
                      bytes,
                    ),
                    onPressed: () {
                      clearImage(
                        bytes,
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 10.h),
              AddingButton(
                text: "+ Выбрать из галереи",
                onPressed: () => pickImage(context),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
                    maxHeight: 0.5,
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
              TextFieldWidgetWithTitle(
                maxLines: 3,
                controller: desc,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                title: "Описание",
                titleStyle:
                    AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
                hintText: "Напишите сообщение",
              ),
              const Spacer(),
              GlButton(
                text: isLoading ? "Загрузка.." : "Опубликовать",
                onPressed: () {
                  if (desc.text.isNotEmpty && selectedCategory != null) {
                    final newPost = Post(
                      text: desc.text,
                      category: selectedCategory,
                    );
                    if (selectedImageBytes.isNotEmpty) {
                      context.read<PostCreateBloc>().add(
                            PostCreateEvent.createPost(
                              post: newPost,
                              imageFiles: selectedImageBytes,
                            ),
                          );
                    } else {
                      context.read<PostCreateBloc>().add(
                            PostCreateEvent.createPost(
                              post: newPost,
                            ),
                          );
                    }
                  }
                },
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
