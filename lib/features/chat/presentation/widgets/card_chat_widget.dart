import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/chat_room.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';

class CardChatWidget extends StatefulWidget {
  const CardChatWidget({
    super.key,
    required this.userId,
    required this.chatRooms,
  });

  final String userId;

  final ChatRoom chatRooms;

  @override
  State<CardChatWidget> createState() => _CardChatWidgetState();
}

class _CardChatWidgetState extends State<CardChatWidget> {
  @override
  void initState() {
    super.initState();
    context
        .read<UserDetailBloc>()
        .add(UserDetailEvent.getUserDetail(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return GestureDetector(
      onTap: () {
        router.push(
          '/home/chat/${RouterContants.chatMessages}/${widget.userId}',
        );
      },
      child: BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            error: (message) => const Center(
              child: Text('error'),
            ),
            success: (userData) {
              return Container(
                height: 74,
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserAvatarWithName(
                      width: 60.w,
                      height: 60.h,
                      raduis: 30,
                      avatar: userData.profilePictureUrl,
                      name: '${userData.username}',
                      subTitle: widget.chatRooms.lastMessage ?? "пусто",
                    ),
                    MessageCheckTimeTextWidget(
                      userId: widget.userId,
                      chatRoom: widget.chatRooms,
                    ),
                  ],
                ),
              );
            },
            orElse: () => Container(),
          );
        },
      ),
    );
  }
}
