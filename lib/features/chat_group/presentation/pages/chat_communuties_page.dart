import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_all_chat_group_bloc/get_all_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/card_chat_group_widget.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

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
                final currentUid = firebaseAuth.currentUser!.uid;
                final filterGroups = groups
                    .where(
                      (element) => element.joinedUserIds!.contains(currentUid),
                    )
                    .toList();
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return CardChatGroupWidget(
                      groupId: filterGroups[index].groupId.toString(),
                      groupRoom: filterGroups[index],
                    );
                  },
                  separatorBuilder: (context, index) => Container(),
                  itemCount: filterGroups.length,
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
