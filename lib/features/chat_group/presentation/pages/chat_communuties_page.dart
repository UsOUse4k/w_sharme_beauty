import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

class ChatCommunitiesPage extends StatelessWidget {
  const ChatCommunitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = firebaseAuth.currentUser!.uid;
    return SafeArea(
      child: CustomContainer(
        marginTop: 15,
        marginBottom: 15,
        child: BlocBuilder<CommunityListBloc, CommunityListState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (communities) {
                final groups = communities
                    .where(
                      (element) => element.participants!.contains(currentUser),
                    )
                    .toList();
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final community = groups[index];
                    return community.chatGroupId != null
                        ? CardChatGroupWidget(
                            groupId: community.chatGroupId.toString(),
                            communityId: community.communityId.toString(),
                          )
                        : null;
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: groups.length,
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text(message)),
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
