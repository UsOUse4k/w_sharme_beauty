import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/card_message_widget.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({
    super.key,
    required this.chatRoomId,
    required this.typeMessages,
    required this.messages,
  });

  final String chatRoomId;
  final String typeMessages;
  final List<Message> messages;
  @override
  Widget build(BuildContext context) {
    final myUid = firebaseAuth.currentUser!.uid;
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      physics: const BouncingScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages.elementAt(index);
        final isMyMessage = message.senderId == myUid;
        final formatDate = formatDateTime(message.timestamp!);
        if (typeMessages == 'chat') {
          if (!isMyMessage) {
            context.read<SeenMessageBloc>().add(
                  SeenMessageEvent.seenMessage(
                    senderId: message.senderId.toString(),
                    chatRoomId: chatRoomId,
                    messageId: message.messageId.toString(),
                  ),
                );
          }
        }
        if (isMyMessage) {
          return CardMessageWidget(
            message: message.message.toString(),
            date: formatDate,
            check: true,
            seen: message.seen,
            data: message,
          );
        } else {
          return CardMessageWidget(
            message: message.message.toString(),
            date: formatDate,
            check: false,
            seen: false,
            avatar: message.avatarUrl,
            username: message.username,
            data: message,
          );
        }
      },
    );
  }
}
