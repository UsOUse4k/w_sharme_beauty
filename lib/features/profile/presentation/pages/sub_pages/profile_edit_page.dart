import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/pick_image.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/category_list_bloc/category_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/profile_info_update/profile_info_update_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/%D1%81ategory_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/adding_button.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/features/profile/presentation/widgets/text_field_widget_with_title.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});
  static const String route = 'profile-edit';

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  Uint8List? avatar;
  String? avatarUrl;
  bool isLoading = false;
  final TextEditingController location = TextEditingController();
  final TextEditingController aboutYourself = TextEditingController();
  final TextEditingController username = TextEditingController();

  Future<void> selectedImage() async {
    avatar = await pickImage(context);
    setState(() {});
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
          title: 'Редактировать профиль',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
        child: BlocListener<MyProfileInfoBloc, MyProfileInfoState>(
          listener: (context, state) {
            state.maybeWhen(
              succes: (user) {
                if (user.category != null && user.category!.isNotEmpty) {
                  context
                      .read<CategoryListBloc>()
                      .add(CategoryListEvent.loaded(user.category!));
                }
                username.text = user.username ?? '';
                location.text = user.city ?? '';
                aboutYourself.text = user.aboutYourself ?? '';
                avatarUrl = user.profilePictureUrl ?? '';
                isLoading = false;
                setState(() {});
              },
              orElse: () {},
            );
          },
          child: BlocListener<ProfileInfoUpdateBloc, ProfileInfoUpdateState>(
            listener: (context, state) {
              state.maybeWhen(
                loading: () {
                  setState(() {
                    isLoading = true;
                  });
                },
                success: () {
                  context
                      .read<MyProfileInfoBloc>()
                      .add(const MyProfileInfoEvent.getMe());
                  context.go('/profile');
                  setState(() {
                    isLoading = false;
                  });
                  context.pop();
                },
                error: (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ошибка при сохрание'),
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
                SizedBox(height: 10.h),
                Expanded(
                  flex: 35,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ваш аватар",
                            style: AppStyles.w500f14
                                .copyWith(color: AppColors.darkGrey),
                          ),
                          SizedBox(height: 10.h),
                          if (avatar != null )
                            CardImageProfileAdd(
                              radius: 50,
                              image: MemoryImage(avatar!),
                              onPressed: () {
                                avatar = null;
                                setState(() {});
                              },
                            )
                          else if (avatarUrl != null && avatarUrl != '')
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                              child: GlCachedNetworImage(
                                height: 100.h,
                                width: 100.w,
                                urlImage: avatarUrl,
                              ),
                            ),
                          SizedBox(height: 10.h),
                          AddingButton(
                            onPressed: selectedImage,
                            text: "+ Изменить фото или аватар",
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      TextFieldWidgetWithTitle(
                        title: 'Имя пользователя',
                        hintText: 'Имя пользователя',
                        controller: username,
                        raduis: 10,
                      ),
                      SizedBox(height: 10.h),
                      const CategoryBottomSheet(),
                      SizedBox(height: 10.h),
                      TextFieldWidgetWithTitle(
                        title: 'Ваше местоположение',
                        hintText: 'Ваше местоположение',
                        controller: location,
                        raduis: 10,
                      ),
                      SizedBox(height: 10.h),
                      TextFieldWidgetWithTitle(
                        maxLines: 3,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        title: 'О себе',
                        hintText: 'Расскажите о себе',
                        raduis: 10,
                        controller: aboutYourself,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                BlocBuilder<CategoryListBloc, CategoryListState>(
                  builder: (context, state) {
                    return GlButton(
                      text: isLoading ? 'Сохранение...' : 'Сохранить изменения',
                      onPressed: () {
                        if (avatar != null && avatar!.isNotEmpty) {
                          context.read<ProfileInfoUpdateBloc>().add(
                                ProfileInfoUpdateEvent.update(
                                  UserProfile(
                                    aboutYourself: aboutYourself.text,
                                    city: location.text,
                                    username: username.text,
                                    category: state.selectedTitle,
                                  ),
                                  avatar: avatar,
                                ),
                              );
                        } else {
                          context.read<ProfileInfoUpdateBloc>().add(
                                ProfileInfoUpdateEvent.update(
                                  UserProfile(
                                    aboutYourself: aboutYourself.text,
                                    city: location.text,
                                    username: username.text,
                                    profilePictureUrl: avatarUrl,
                                    category: state.selectedTitle,
                                  ),
                                ),
                              );
                        }
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    context.read<MyProfileInfoBloc>().add(const MyProfileInfoEvent.getMe());
    super.initState();
  }

  @override
  void dispose() {
    location.dispose();
    aboutYourself.dispose();
    username.dispose();
    super.dispose();
  }
}
