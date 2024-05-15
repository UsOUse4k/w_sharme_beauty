import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/utils/format_date/get_user_status.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/chat_group_check_manager/chat_group_check_manager_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/get_group_bloc/get_group_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/widgets.dart';

class ChatParticipantsPage extends StatefulWidget {
  const ChatParticipantsPage({super.key, required this.groupId});
  final String groupId;

  @override
  State<ChatParticipantsPage> createState() => _ChatParticipantsPageState();
}

class _ChatParticipantsPageState extends State<ChatParticipantsPage> {
  @override
  void initState() {
    context
        .read<GetGroupBloc>()
        .add(GetGroupEvent.getGroup(groupId: widget.groupId));
    super.initState();
  }

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
                context.read<ChatGroupCheckManagerBloc>().add(
                      ChatGroupCheckManagerEvent.getAllAdministrator(
                        administrator: group.administrator!,
                        editors: group.editors!,
                        groupId: group.groupId!,
                      ),
                    );
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    const SearchWidget(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: group.joinedUserIds!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final formatDate =
                              getUserStatus(userProfiles[index].lastSeen!);
                          return SubscribersListTileWidget(
                            title: userProfiles[index].username.toString(),
                            subtitle: formatDate,
                            avatar: userProfiles[index]
                                .profilePictureUrl
                                .toString(),
                            onTap: () {
                              if (group.userId == group.joinedUserIds![index]) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Владелец',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              } else {
                                BottomSheetUtil.showAppBottomSheet(
                                  context,
                                  ShowModalBottomSheetWidget(
                                    text1: 'Назначить руководителем',
                                    onTap1: () {
                                      Navigator.pop(context);
                                      context.push(
                                        '/home/chat/chatGroupMessages/${widget.groupId}/chatParticipants/${widget.groupId}/appointManagment/${userProfiles[index].uid}/${group.userId}',
                                      );
                                    },
                                    text2: 'Удалить из сообщества',
                                    onTap2: () {},
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
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
