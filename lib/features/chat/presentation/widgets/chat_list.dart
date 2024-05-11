import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_messages_bloc/get_messages_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/seen_message_bloc/seen_message_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/card_message_widget.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class ChatMessageList extends StatefulWidget {
  const ChatMessageList({
    super.key,
    required this.chatRoomId,
  });

  final String chatRoomId;

  @override
  State<ChatMessageList> createState() => _ChatMessageListState();
}

class _ChatMessageListState extends State<ChatMessageList> {
  @override
  void initState() {
    context
        .read<GetMessagesBloc>()
        .add(GetMessagesEvent.getMessages(chatRoomId: widget.chatRoomId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myUid = firebaseAuth.currentUser!.uid;
    return BlocBuilder<GetMessagesBloc, GetMessagesState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (messages) {
            return ListView.builder(
              shrinkWrap: true,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages.elementAt(index);
                final isMyMessage = message.senderId == myUid;
                final formatDate = formatDateTime(message.timestamp!);
                if (!isMyMessage) {
                  context.read<SeenMessageBloc>().add(
                        SeenMessageEvent.seenMessage(
                          senderId: message.senderId.toString(),
                          chatRoomId: widget.chatRoomId,
                          messageId: message.messageId.toString(),
                        ),
                      );
                }
                if (isMyMessage) {
                  return CardMessageWidget(
                    message: message.message.toString(),
                    date: formatDate,
                    check: true,
                    seen: message.seen,
                  );
                } else {
                  return CardMessageWidget(
                    message: message.message.toString(),
                    date: formatDate,
                    check: false,
                    seen: false,
                  );
                }
              },
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
