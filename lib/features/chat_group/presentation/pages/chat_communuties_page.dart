import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/card_chat_group_widget.dart';

class ChatCommunitiesPage extends StatefulWidget {
  const ChatCommunitiesPage({super.key});

  @override
  State<ChatCommunitiesPage> createState() => _ChatCommunitiesPageState();
}

class _ChatCommunitiesPageState extends State<ChatCommunitiesPage> {
  @override
  void initState() {
    context
        .read<GetAllChatGroupBloc>()
        .add(const GetAllChatGroupEvent.getAllChatGroups());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomContainer(
        marginTop: 15,
        marginBottom: 15,
        child: BlocBuilder<GetAllChatGroupBloc, GetAllChatGroupState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (groups) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return CardChatGroupWidget(
                      groupId: groups[index].groupId.toString(),
                      groupRoom: groups[index],
                    );
                  },
                  separatorBuilder: (context, index) => Container(),
                  itemCount: groups.length,
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
