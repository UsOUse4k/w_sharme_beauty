import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/update_status_user_bloc/update_status_user_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/bloc/get_all_chats_bloc/get_all_chats_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/pages/sub_pages/sub_pages.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context
        .read<CommunityListBloc>()
        .add(const CommunityListEvent.getCommunities());
    context
        .read<UpdateStatusUserBloc>()
        .add(const UpdateStatusUserEvent.updateStatusUser());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _handleSearch(String value) {
    if (_tabController.index == 0) {
      // Поиск в чатах пользователей
      context.read<GetAllChatsBloc>().add(GetAllChatsEvent.searchChat(query: value));
    } else if (_tabController.index == 1) {
      // Поиск в чатах сообществ
      context.read<CommunityListBloc>().add(CommunityListEvent.searchCommunityChatGroup(query: value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.pop();
          },
        ),
        title: CenterTitleAppBar(
          title: 'Чат',
          textStyle: AppStyles.w500f18,
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 15),
            child: Column(
              children: [
                SearchWidget(onChanged: (value) => _handleSearch(value)),
                const SizedBox(
                  height: 15,
                ),
                GlTabBarWidget(
                  tabController: _tabController,
                  tabBarItem1: 'Чат',
                  tabBarItem2: 'Чат сообществ',
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            ChatPersonsPage(),
            ChatCommunitiesPage(),
          ],
        ),
      ),
    );
  }
}
