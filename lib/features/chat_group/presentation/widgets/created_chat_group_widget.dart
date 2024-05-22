import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/pick_image.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/core/widgets/gl_cached_networ_image.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/user_profile.dart';
import 'package:w_sharme_beauty/features/chat_group/domain/entities/chat_group_room.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/create_chat_group_bloc/create_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart';
import 'package:w_sharme_beauty/features/profile/presentation/pages/widgets/image_card_profile_add.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class CreateChatGroupWidget extends StatefulWidget {
  const CreateChatGroupWidget({
    super.key,
    required this.users,
    required this.communityId,
  });
  final List<UserProfile> users;
  final String communityId;

  @override
  State<CreateChatGroupWidget> createState() => _CreateChatGroupWidgetState();
}

class _CreateChatGroupWidgetState extends State<CreateChatGroupWidget> {
  final TextEditingController chatNameCtrl = TextEditingController();
  Uint8List? file;

  Future<void> selectedImage() async {
    file = await pickImage(context);
    setState(() {});
  }

  @override
  void dispose() {
    chatNameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> userIds =
        widget.users.map((user) => user.uid.toString()).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: BlocListener<CreateChatGroupBloc, CreateChatGroupState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (groupId) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Успешно'),
                ),
              );
              context
                  .read<MyCommunityListBloc>()
                  .add(const MyCommunityListEvent.getMyCommunity());
            },
            orElse: () {},
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (file != null)
                  CardImageProfileAdd(
                    width: 47.w,
                    height: 47.h,
                    image: MemoryImage(file!),
                    onPressed: () {
                      setState(() {
                        file = null;
                      });
                    },
                  )
                else
                  InkWell(
                    onTap: selectedImage,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: 47.h,
                        width: 47.w,
                        child: Image.asset(
                          Assets.images.camera.path,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    controller: chatNameCtrl,
                    decoration: InputDecoration(
                      hintText: 'Название чата',
                      filled: true,
                      fillColor: AppColors.lightGrey,
                      labelStyle: const TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Участники",
              style: AppStyles.w500f18.copyWith(
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 240,
              child: ListView.separated(
                itemBuilder: (context, index) => Row(
                  children: [
                    if (widget.users[index].profilePictureUrl != '')
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: GlCachedNetworImage(
                          height: 50.h,
                          width: 50.w,
                          urlImage: widget.users[index].profilePictureUrl,
                        ),
                      )
                    else
                      SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: const CircleAvatar(
                          backgroundColor: AppColors.grey,
                          child: Icon(
                            Icons.image_not_supported_outlined,
                          ),
                        ),
                      ),
                    const SizedBox(width: 10),
                    Text(
                      widget.users[index].username.toString(),
                      style: AppStyles.w500f18,
                    ),
                  ],
                ),
                separatorBuilder: (buildContext, a) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: widget.users.length,
                // shrinkWrap: true,
              ),
            ),
            const SizedBox(height: 20),
            GlButton(
              text: "Создать чат",
              onPressed: () {
                if (chatNameCtrl.text.isNotEmpty && file != null) {
                  context.read<CreateChatGroupBloc>().add(
                        CreateChatGroupEvent.createChatGroup(
                          chatGroup: ChatGroupRoom(
                            groupName: chatNameCtrl.text,
                            joinedUserIds: userIds,
                          ),
                          file: file!,
                          communityId: widget.communityId,
                        ),
                      );
                } else {
                  showMyDialog(
                    context,
                    'Вы должны выбрать картину для группы или написать названия чата',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
