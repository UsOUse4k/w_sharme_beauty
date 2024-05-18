import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';

class ChatPersonsPage extends StatefulWidget {
  const ChatPersonsPage({super.key});

  @override
  State<ChatPersonsPage> createState() => _ChatPersonsPageState();
}

class _ChatPersonsPageState extends State<ChatPersonsPage> {
  @override
  void initState() {
    context
        .read<GetAllChatsBloc>()
        .add(const GetAllChatsEvent.getAllChatRoom());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomContainer(
        marginTop: 15,
        marginBottom: 15,
        child: BlocBuilder<GetAllChatsBloc, GetAllChatsState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (chatRooms) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final myUid = firebaseAuth.currentUser!.uid;
                    final chat = chatRooms.elementAt(index);
                    final userId = chat.members!.firstWhere(
                      (userId) => userId != myUid,
                    );
                    return CardChatWidget(
                      userId: userId,
                      chatRooms: chat,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 8.h),
                  itemCount: chatRooms.length,
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
