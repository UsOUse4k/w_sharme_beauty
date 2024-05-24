import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/pick_image.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';

import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/update_chat_group_bloc/update_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/widgets.dart';

class ChatGroupEditPage extends StatefulWidget {
  const ChatGroupEditPage({
    super.key,
    required this.groupId,
    required this.communityId,
  });

  final String groupId;
  final String communityId;

  @override
  State<ChatGroupEditPage> createState() => _ChatGroupEditPageState();
}

class _ChatGroupEditPageState extends State<ChatGroupEditPage> {
  final TextEditingController _groupNameCtrl = TextEditingController();
  Uint8List? avatar;
  bool isLoading = false;

  Future<void> selectedImage() async {
    avatar = await pickImage(context);
    setState(() {});
  }

  @override
  void dispose() {
    _groupNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = firebaseAuth.currentUser;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlAppBar(
        leading: GlIconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: CenterTitleAppBar(
          title: 'Редактировать',
          textStyle: AppStyles.w500f18,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: BlocListener<UpdateChatGroupBloc, UpdateChatGroupState>(
            listener: (context, state) {
              state.maybeWhen(
                loading: () => setState(() => isLoading = true),
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ошибка при редактировании'),
                    ),
                  );
                  setState(() => isLoading = false);
                },
                success: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Успешно редактировано'),
                    ),
                  );
                  context.read<GetGroupBloc>().add(
                        GetGroupEvent.getGroup(
                          groupId: widget.groupId,
                          communityId: widget.communityId,
                        ),
                      );
                  setState(() => isLoading = false);
                },
                orElse: () {},
              );
            },
            child: BlocBuilder<GetGroupBloc, GetGroupState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (group, userProfiles) {
                    _groupNameCtrl.text = group.groupName.toString();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldWidgetWithTitle(
                          controller: _groupNameCtrl,
                          title: 'Название чата',
                          hintText: 'Название чата',
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'Аватар сообщества',
                          style: AppStyles.w500f14.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        if (avatar != null)
                          CardImageProfileAdd(
                            radius: 50,
                            image: MemoryImage(avatar!),
                            onPressed: () {
                              avatar = null;
                              setState(() {});
                            },
                          )
                        else if (group.groupProfileImage != null)
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: GlCachedNetworImage(
                              height: 100,
                              width: 100,
                              urlImage: group.groupProfileImage,
                            ),
                          ),
                        SizedBox(height: 10.h),
                        AddingButton(
                          onPressed: selectedImage,
                          text: "+ Изменить фото или аватар",
                        ),
                        const Spacer(),
                        GlButton(
                          text: isLoading ? "Загрузка..." : 'Сохранить',
                          onPressed: () {
                            if (currentUser!.uid == group.userId) {
                              if (avatar != null) {
                                context.read<UpdateChatGroupBloc>().add(
                                      UpdateChatGroupEvent.updateChatGroup(
                                        groupId: widget.groupId,
                                        file: avatar,
                                        communityId: widget.communityId,
                                      ),
                                    );
                              } else {
                                context.read<UpdateChatGroupBloc>().add(
                                      UpdateChatGroupEvent.updateChatGroup(
                                        groupId: widget.groupId,
                                        groupName: _groupNameCtrl.text,
                                        communityId: widget.communityId,
                                      ),
                                    );
                              }
                            } else if (group.editors != null &&
                                group.editors!.contains(currentUser.uid) ==
                                    true && avatar != null) {
                              context.read<UpdateChatGroupBloc>().add(
                                    UpdateChatGroupEvent.updateChatGroup(
                                      groupId: widget.groupId,
                                      file: avatar,
                                      communityId: widget.communityId,
                                    ),
                                  );
                            } else {
                              showMyDialog(context, 'У вас нет права!');
                            }
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
        ),
      ),
    );
  }
}
