// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/utils/pick_image.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/chat_group_input_model.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';

class ChatGroupMessagesPage extends StatefulWidget {
  const ChatGroupMessagesPage({
    super.key,
    required this.groupId,
    required this.communityId,
  });

  final String groupId;
  final String communityId;

  @override
  State<ChatGroupMessagesPage> createState() => _ChatGroupMessagesPageState();
}

class _ChatGroupMessagesPageState extends State<ChatGroupMessagesPage> {
  final TextEditingController sendMessageCtrl = TextEditingController();

  Uint8List? file;
  Future<void> selectedImage(String groupRoomId) async {
    file = await pickImage(context);
    setState(() {});
    if (file != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return ChatGroupInputModal(
            imageFile: file!,
            communityId: widget.communityId,
            groupId: groupRoomId,
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<GetAllGroupMessagesBloc>().add(
          GetAllGroupMessagesEvent.getAllGroupMessages(
            groupId: widget.groupId,
            communityId: widget.communityId,
          ),
        );
  }

  @override
  void dispose() {
    sendMessageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: GlAppBar(
        leading: GlIconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            router.pop();
          },
        ),
        title: BlocConsumer<GetGroupBloc, GetGroupState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (group, userProfiles) {
                context.read<ChatGroupCheckManagerBloc>().add(
                      ChatGroupCheckManagerEvent.getAllAdministrator(
                        administrator: group.administrator!,
                        editors: group.editors!,
                        groupId: group.groupId!,
                      ),
                    );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              success: (group, userProfiles) {
                return InkWell(
                  onTap: () {
                    BottomSheetUtil.showAppBottomSheet(
                      context,
                      CustomBottomSheetLeading(
                        maxHeight: 0.5,
                        navbarTitle: 'Управление чатом сообщества',
                        widget: ChatManagmentWidget(
                          groupRoom: group,
                          communityId: widget.communityId,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CenterTitleAppBar(
                        title: group.groupName.toString(),
                        textStyle: AppStyles.w500f16,
                      ),
                      Text(
                        '${group.joinedUserIds!.length} участников',
                        style:
                            AppStyles.w400f14.copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                );
              },
              orElse: () => Container(),
            );
          },
        ),
        action: BlocBuilder<GetGroupBloc, GetGroupState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (group, userProfiles) {
                return GestureDetector(
                  onTap: () {
                    BottomSheetUtil.showAppBottomSheet(
                      context,
                      CustomBottomSheetLeading(
                        maxHeight: 0.5,
                        navbarTitle: 'Управление чатом сообщества',
                        widget: ChatManagmentWidget(
                          groupRoom: group,
                          communityId: widget.communityId,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                    child: GlCachedNetworImage(
                      height: 40.h,
                      width: 40.w,
                      urlImage: group.groupProfileImage,
                    ),
                  ),
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<GetAllGroupMessagesBloc, GetAllGroupMessagesState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (messages) {},
              orElse: () {
                context.read<GetGroupBloc>().add(
                      GetGroupEvent.getGroup(
                        groupId: widget.groupId,
                        communityId: widget.communityId,
                      ),
                    );
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  flex: 70,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 18,
                      right: 18,
                    ),
                    decoration: const BoxDecoration(color: AppColors.bgColors),
                    child: state.maybeWhen(
                      success: (messages) {
                        return ChatMessageList(
                          messages: messages,
                          chatRoomId: '',
                          typeMessages: 'group',
                        );
                      },
                      orElse: () => Container(),
                    ),
                  ),
                ),
                const Spacer(),
                TextFieldSendMessageWidget(
                  onGallery: () => selectedImage(widget.groupId),
                  controller: sendMessageCtrl,
                  onPressed: () {
                    if (sendMessageCtrl.text.isNotEmpty) {
                      context.read<SendMessageGroupBloc>().add(
                            SendMessageGroupEvent.sendMessage(
                              groupId: widget.groupId,
                              message: sendMessageCtrl.text,
                              communityId: widget.communityId,
                            ),
                          );
                      sendMessageCtrl.clear();
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
