// ignore_for_file: use_build_context_synchronously
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/filter_button_widget.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_create_post_bloc/community_create_post_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_post_list_bloc/community_post_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/profile/data/local_category_data.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';

class CommunityAddPublicPage extends StatefulWidget {
  const CommunityAddPublicPage({super.key, required this.communityId});

  final String communityId;

  @override
  State<CommunityAddPublicPage> createState() => _CommunityAddPublicPageState();
}

class _CommunityAddPublicPageState extends State<CommunityAddPublicPage> {
  List<Uint8List> selectedImageBytes = [];
  String filterText = 'Категория';
  String? selectedCategory;
  bool isLoading = false;
  Uint8List? selectedVideoThumbnail;
  XFile? selectedVideoFile;
  final TextEditingController desc = TextEditingController();

  Future<void> pickMedia(BuildContext context, bool isVideo) async {
    final ImagePicker picker = ImagePicker();
    if (isVideo) {
      final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
      if (video != null) {
        final Uint8List? thumbnail = await VideoThumbnail.thumbnailData(
          video: video.path,
          imageFormat: ImageFormat.JPEG,
          maxWidth: 100,
          maxHeight: 100,
          quality: 25,
        );
        setState(() {
          selectedVideoFile = video;
          selectedVideoThumbnail = thumbnail;
          selectedImageBytes = [];
        });
      }
    } else {
      final List<XFile> images = await picker.pickMultiImage();
      for (final XFile image in images) {
        final Uint8List imageData = await image.readAsBytes();
        setState(() {
          selectedImageBytes.add(imageData);
          selectedVideoFile = null;
          selectedVideoThumbnail = null;
        });
      }
    }
  }


  void showPickMediaDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Выберите тип медиа"),
          content: const Text("Выберите изображения или видео для загрузки."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                pickMedia(context, false);
              },
              child: const IconCategoryGallery(
                icon: Icon(
                  Icons.image_outlined,
                  color: AppColors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                pickMedia(context, true);
              },
              child: const IconCategoryGallery(
                icon: Icon(
                  Icons.video_camera_back_outlined,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
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
      body: BlocListener<CommunityCreatePostBloc, CommunityCreatePostState>(
        listener: (context, state) {
          state.maybeMap(
            loading: (value) {
              setState(() {
                isLoading = true;
              });
            },
            success: (value) {
              context.read<CommunityPostListBloc>().add(
                    CommunityPostListEvent.addPost(
                      value.post,
                    ),
                  );
              setState(() {
                selectedImageBytes = [];
                desc.clear();
                isLoading = false;
              });
              context.pop();
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
              SizedBox(height: 10.h),
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
              const SizedBox(height: 20),
              AddingButton(
                text: "+ Выбрать из галереи",
                onPressed: () => showPickMediaDialog(context),
              ),
              const SizedBox(height: 20),
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
                    maxHeight: 0.5,
                    navbarTitle: 'Категория',
                    widget: AllCommunityBottomSheet(
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
              const SizedBox(height: 20),
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
                    if (selectedImageBytes.isNotEmpty) {
                      context.read<CommunityCreatePostBloc>().add(
                            CommunityCreatePostEvent.createPost(
                              Post(
                                text: desc.text,
                                category: selectedCategory,
                              ),
                              imageFiles: selectedImageBytes,
                              communityId: widget.communityId,
                            ),
                          );
                    } else if(selectedVideoFile != null) {
                      context.read<CommunityCreatePostBloc>().add(
                            CommunityCreatePostEvent.createPost(
                              Post(
                                text: desc.text,
                                category: selectedCategory,
                              ),
                              imageFiles: selectedImageBytes,
                              communityId: widget.communityId,
                            ),
                          );
                    } else {
                      context.read<CommunityCreatePostBloc>().add(
                            CommunityCreatePostEvent.createPost(
                              Post(
                                text: desc.text,
                                category: selectedCategory,
                              ),
                              communityId: widget.communityId,
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
