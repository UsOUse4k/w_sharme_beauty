import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/remove_admin_chat_group_bloc/remove_admin_chat_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/participants_list.dart';

class ChatParticipantsPage extends StatelessWidget {
  const ChatParticipantsPage({
    super.key,
    required this.groupId,
    this.communityId,
  });
  final String groupId;
  final String? communityId;

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Участники',
          textStyle: AppStyles.w500f22,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<GetGroupBloc, GetGroupState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (group, userProfiles) {
                return BlocListener<RemoveAdminChatGroupBloc,
                    RemoveAdminChatGroupState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      success: () {
                        context.read<GetGroupBloc>().add(
                              GetGroupEvent.getGroup(
                                groupId: groupId,
                                communityId: communityId.toString(),
                              ),
                            );
                      },
                      orElse: () {},
                    );
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      SearchWidget(
                        onChanged: (value) {
                          context
                              .read<GetGroupBloc>()
                              .add(GetGroupEvent.searchUsers(query: value));
                        },
                      ),
                      Expanded(
                        child: ParticipantsList(
                          group: group,
                          userProfiles: userProfiles,
                        ),
                      ),
                    ],
                  ),
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
