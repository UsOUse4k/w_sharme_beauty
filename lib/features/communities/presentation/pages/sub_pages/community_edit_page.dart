import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/pick_image.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_detail_bloc/community_detail_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/update_community_bloc/update_community_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/widgets.dart';

class CommunityEditPage extends StatefulWidget {
  const CommunityEditPage({
    super.key,
    required this.communityId,
  });

  final String communityId;

  @override
  State<CommunityEditPage> createState() => _CommunityEditPageState();
}

class _CommunityEditPageState extends State<CommunityEditPage> {
  final TextEditingController _communityNameCtrl = TextEditingController();
  final TextEditingController _categoryCtrl = TextEditingController();
  final TextEditingController _descNameCtrl = TextEditingController();

  Uint8List? file;

  Future<void> selectedImage() async {
    file = await pickImage(context);
    setState(() {});
  }

  @override
  void initState() {
    if (mounted) {
      context
          .read<CommunityDetailBloc>()
          .add(CommunityDetailEvent.loaded(widget.communityId));
    }
    super.initState();
  }

  @override
  void dispose() {
    _categoryCtrl.dispose();
    _communityNameCtrl.dispose();
    _descNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    GoRouter.of(context);
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: IconButton(
          iconSize: 16,
          onPressed: () {
            context.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Center(
          child: Text(
            "Редактировать",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<CommunityDetailBloc, CommunityDetailState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (community) {
                _categoryCtrl.text = community.category ?? '';
                _communityNameCtrl.text = community.communityName ?? '';
                _descNameCtrl.text = community.description ?? '';
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
              success: (community) {
                return BlocListener<UpdateCommunityBloc, UpdateCommunityState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      succes: () {
                        context.read<CommunityDetailBloc>().add(
                              CommunityDetailEvent.loaded(widget.communityId),
                            );
                      },
                      orElse: () {},
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      TextFieldWidgetWithTitle(
                        controller: _communityNameCtrl,
                        title: "Название сообщества",
                        titleStyle: AppStyles.w500f14
                            .copyWith(color: AppColors.darkGrey),
                        hintStyle: AppStyles.w400f16,
                      ),
                      const SizedBox(height: 14),
                      TextFieldWidgetWithTitle(
                        controller: _categoryCtrl,
                        title: "Категория сообщества",
                        titleStyle: AppStyles.w500f14
                            .copyWith(color: AppColors.darkGrey),
                        hintStyle: AppStyles.w400f16,
                        suffixIcon: const Icon(
                          Icons.expand_more_outlined,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Аватар сообщества",
                        style: AppStyles.w500f14
                            .copyWith(color: AppColors.darkGrey),
                      ),
                      const SizedBox(height: 8),
                      //Image.asset(Assets.images.ava.path),
                      const SizedBox(
                        height: 10,
                      ),
                      if (file != null)
                        CardImageProfileAdd(
                          radius: 50,
                          image: MemoryImage(file!),
                          onPressed: () {
                            file = null;
                            setState(() {});
                          },
                        )
                      else
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: GlCachedNetworImage(
                            width: 100.w,
                            height: 100.h,
                            urlImage: community.avatarUrls,
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      AddingButton(
                        text: '+ Выбрать фото',
                        onPressed: selectedImage,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFieldWidgetWithTitle(
                        controller: _descNameCtrl,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        title: "Описание сообщества",
                        titleStyle:
                            AppStyles.w500f14.copyWith(color: AppColors.grey),
                        hintStyle: AppStyles.w400f16,
                        maxLines: 2,
                      ),
                      Text(
                        "Используйте слова, которые описывают тематику сообщества и помогают быстрее его найти. Изменить описание можно в любой момент.",
                        style: AppStyles.w400f13
                            .copyWith(color: AppColors.darkGrey),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      GlButton(
                        text: 'Сохранить',
                        onPressed: () {
                          if (file != null) {
                            context.read<UpdateCommunityBloc>().add(
                                  UpdateCommunityEvent.updateCommunity(
                                    communityName: _communityNameCtrl.text,
                                    desc: _descNameCtrl.text,
                                    category: _categoryCtrl.text,
                                    file: file,
                                    communityId: widget.communityId,
                                  ),
                                );
                          } else {
                            context.read<UpdateCommunityBloc>().add(
                                  UpdateCommunityEvent.updateCommunity(
                                    communityName: _communityNameCtrl.text,
                                    desc: _descNameCtrl.text,
                                    category: _categoryCtrl.text,
                                    communityId: widget.communityId,
                                  ),
                                );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
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
    );
  }
}
