// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/get_user_status.dart';
import 'package:w_sharme_beauty/core/utils/pick_image.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';

class ChatMessagesPage extends StatefulWidget {
  const ChatMessagesPage({super.key, this.userId});

  final String? userId;

  @override
  State<ChatMessagesPage> createState() => _ChatMessagesPageState();
}

class _ChatMessagesPageState extends State<ChatMessagesPage> {
  final TextEditingController sendMessageCtrl = TextEditingController();
  Uint8List? file;

  Future<void> selectedImage(String chatRoomId) async {
    file = await pickImage(context);
    setState(() {});
    if (file != null) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return ImageInputModal(
            imageFile: file!,
            userId: widget.userId.toString(),
            chatRoomId: chatRoomId,
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CreateChatroomBloc>().add(
          CreateChatroomEvent.createdChatRoomId(
            userId: widget.userId.toString(),
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
      appBar: GlAppBar(
        leading: GlIconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            router.pop();
          },
        ),
        title: _buildProfileName(),
        action: _buildAvatarUser(router, widget.userId.toString()),
      ),
      body: BlocConsumer<CreateChatroomBloc, CreateChatroomState>(
        listener: (context, state) {
          state.maybeWhen(
            sucsess: (chatRoomId) {
              context.read<UserDetailBloc>().add(
                    UserDetailEvent.getUserDetail(
                      userId: widget.userId.toString(),
                    ),
                  );
              context
                  .read<UpdateStatusUserBloc>()
                  .add(const UpdateStatusUserEvent.updateStatusUser());
              context.read<GetMessagesBloc>().add(
                    GetMessagesEvent.getMessages(
                      chatRoomId: chatRoomId.toString(),
                    ),
                  );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            sucsess: (chatRoomId) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 18,
                    right: 18,
                    bottom: 4,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 25,
                        child: BlocBuilder<GetMessagesBloc, GetMessagesState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              success: (messages) {
                                return ChatMessageList(
                                  messages: messages,
                                  typeMessages: 'chat',
                                  chatRoomId: chatRoomId.toString(),
                                );
                              },
                              orElse: () => Container(),
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: TextFieldSendMessageWidget(
                          onGallery: () => selectedImage(chatRoomId.toString()),
                          controller: sendMessageCtrl,
                          onPressed: () {
                            if (sendMessageCtrl.text.isNotEmpty) {
                              context.read<SendMessageBloc>().add(
                                    SendMessageEvent.sendMessage(
                                      chatRoomId: chatRoomId.toString(),
                                      message: sendMessageCtrl.text,
                                      receiverId: widget.userId.toString(),
                                    ),
                                  );
                              sendMessageCtrl.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }

  BlocBuilder<UserDetailBloc, UserDetailState> _buildProfileName() {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (userData) {
            final statusTime = getUserStatus(userData.lastSeen!);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CenterTitleAppBar(
                  title: userData.username.toString(),
                  textStyle: AppStyles.w500f16,
                ),
                Text(
                  statusTime,
                  style: AppStyles.w400f14.copyWith(color: AppColors.grey),
                ),
              ],
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }

  BlocBuilder<UserDetailBloc, UserDetailState> _buildAvatarUser(
    GoRouter router,
    String userId,
  ) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (userData) {
            return GestureDetector(
              onTap: () {
                router.pushReplacement(
                  '/home/chat/chatMessages/$userId/profilePersonPage/$userId',
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
                child: GlCachedNetworImage(
                  height: 40.h,
                  width: 40.w,
                  urlImage: userData.profilePictureUrl,
                ),
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
