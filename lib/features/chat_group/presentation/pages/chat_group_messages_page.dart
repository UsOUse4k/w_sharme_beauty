import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/chat_list.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/text_field_send_message_widget.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_group_messages_bloc/get_all_group_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/send_message_group_bloc/send_message_group_bloc.dart';

class ChatGroupMessagesPage extends StatefulWidget {
  const ChatGroupMessagesPage({super.key, required this.groupId});

  final String groupId;

  @override
  State<ChatGroupMessagesPage> createState() => _ChatGroupMessagesPageState();
}

class _ChatGroupMessagesPageState extends State<ChatGroupMessagesPage> {
  final TextEditingController sendMessageCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<GetAllGroupMessagesBloc>().add(
          GetAllGroupMessagesEvent.getAllGroupMessages(
            groupId: widget.groupId,
          ),
        );
    context.read<GetGroupBloc>().add(
          GetGroupEvent.getGroup(groupId: widget.groupId),
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
      body: SafeArea(
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
                child: BlocBuilder<GetAllGroupMessagesBloc,
                    GetAllGroupMessagesState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (messages) {
                        return ChatMessageList(
                          messages: messages,
                          chatRoomId: '',
                          typeMessages: 'group',
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
                  controller: sendMessageCtrl,
                  onPressed: () {
                    if (sendMessageCtrl.text.isNotEmpty) {
                      context.read<SendMessageGroupBloc>().add(
                            SendMessageGroupEvent.sendMessage(
                              groupId: widget.groupId,
                              message: sendMessageCtrl.text,
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
      ),
    );
  }

  BlocBuilder<GetGroupBloc, GetGroupState> _buildProfileName() {
    return BlocBuilder<GetGroupBloc, GetGroupState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (group) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CenterTitleAppBar(
                  title: group.groupName.toString(),
                  textStyle: AppStyles.w500f16,
                ),
                Text(
                  '${group.joinedUserIds!.length} участников',
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

  BlocBuilder<GetGroupBloc, GetGroupState> _buildAvatarUser(
    GoRouter router,
  ) {
    return BlocBuilder<GetGroupBloc, GetGroupState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (group) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              child: GlCachedNetworImage(
                height: 40.h,
                width: 40.w,
                urlImage: group.groupProfileImage,
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
