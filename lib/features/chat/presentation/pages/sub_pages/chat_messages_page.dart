import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/get_user_status.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/create_chatroom_bloc/create_chatroom_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/send_message_bloc/send_message_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/chat_list.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/text_field_send_message_widget.dart';
import 'package:w_sharme_beauty/features/user_details/presentations/bloc/user_detail_bloc/user_detail_bloc.dart';

class ChatMessagesPage extends StatefulWidget {
  const ChatMessagesPage({super.key, this.userId});

  final String? userId;

  @override
  State<ChatMessagesPage> createState() => _ChatMessagesPageState();
}

class _ChatMessagesPageState extends State<ChatMessagesPage> {
  final TextEditingController sendMessageCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    context
        .read<UserDetailBloc>()
        .add(UserDetailEvent.getUserDetail(userId: widget.userId.toString()));
    context
        .read<UpdateStatusUserBloc>()
        .add(const UpdateStatusUserEvent.updateStatusUser());
    context.read<CreateChatroomBloc>().add(
          CreateChatroomEvent.createdChatRoomId(
            chatRoomId: widget.userId.toString(),
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
        action: _buildAvatarUser(router),
      ),
      body: BlocBuilder<CreateChatroomBloc, CreateChatroomState>(
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
                        flex: 8,
                        child: ChatMessageList(
                          chatRoomId: chatRoomId.toString(),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: TextFieldSendMessageWidget(
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
  ) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (userData) {
            return GestureDetector(
              onTap: () {
                router.pushReplacement(
                  '/home/chat/${RouterContants.chatMessages}/${RouterContants.profilePersonPage}',
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
