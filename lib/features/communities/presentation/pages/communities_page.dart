import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/router/router_contants.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_list_bloc/community_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/my_community_list_bloc/my_community_list_bloc.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/beauty_list_widget.dart';
import 'package:w_sharme_beauty/features/communities/presentation/widgets/my_beauty_list_widget.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

const List<String> communityList = ['Мои сообщества', 'Все сообщества'];

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({super.key});

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String filterCommynity = 'Все сообщества';
  String selectedCommunity = 'Все сообщества';
  String filterCategory = 'Категория';
  String? selectedCategory;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context
        .read<CommunityListBloc>()
        .add(const CommunityListEvent.getCommunities());
    context
        .read<MyCommunityListBloc>()
        .add(const MyCommunityListEvent.getMyCommunity());
    context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final route = GoRouter.of(context);
    return GlScaffold(
      horizontalPadding: 16,
      appBar: GlAppBar(
        leading: BlocBuilder<MyProfileInfoBloc, MyProfileInfoState>(
          builder: (context, state) {
            return state.maybeWhen(
              succes: (user) {
                return Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(13),
                      ),
                      child: GlCachedNetworImage(
                        height: 26.h,
                        width: 26.w,
                        urlImage: user.profilePictureUrl,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Сообщество',
                      style: AppStyles.w500f18,
                    ),
                  ],
                );
              },
              orElse: () => Container(),
            );
          },
        ),
        action: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                route.push('/communities/${RouterContants.communityCreate}');
              },
              child: Image.asset(
                Assets.icons.addCommunity.path,
                width: 26,
                height: 26,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                route.push('/home/${RouterContants.chat}');
              },
              child: Image.asset(
                Assets.icons.chat.path,
                width: 26,
                height: 26,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SearchWidget(
            onChanged: (value) {
              context
                  .read<CommunityListBloc>()
                  .add(CommunityListEvent.searchCommunities(query: value));
            },
            hintText: "Поиск сообществ",
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<CommunityListBloc, CommunityListState>(
            builder: (context, state) {
              return state.maybeWhen(
                success: (communities) {
                  return BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        success: (categories) {
                          final categoyList = categories
                              .map((e) => e.title)
                              .where((element) => element != null)
                              .map((element) => element!)
                              .toList();
                          return Row(
                            children: [
                              FilterButtonWidget(
                                width: 200.w,
                                onPressed: () =>
                                    BottomSheetUtil.showAppBottomSheet(
                                  context,
                                  CustomBottomSheet(
                                    maxHeight: 0.33,
                                    navbarTitle: 'Сообщества',
                                    widget: RadioFilterWidget(
                                      list: communityList,
                                      onSelect: (String text) {
                                        filterCommynity = text;
                                        selectedCommunity = text;
                                        context.read<CommunityListBloc>().add(
                                              CommunityListEvent
                                                  .filterCommunity(
                                                filterCommunity:
                                                    selectedCommunity,
                                              ),
                                            );
                                        setState(() {});
                                      },
                                      selectedValue: selectedCommunity,
                                    ),
                                  ),
                                ),
                                title: filterCommynity,
                              ),
                              const SizedBox(width: 10),
                              FilterButtonWidget(
                                width: 150.w,
                                onPressed: () =>
                                    BottomSheetUtil.showAppBottomSheet(
                                  context,
                                  CustomBottomSheet(
                                    maxHeight: 0.55,
                                    navbarTitle: 'Категория',
                                    widget: RadioFilterWidget(
                                      list: categoyList,
                                      onSelect: (String text) {
                                        filterCategory = text;
                                        selectedCategory = text;
                                        context.read<CommunityListBloc>().add(
                                              CommunityListEvent
                                                  .filterCommunity(
                                                filterCommunity:
                                                    selectedCategory!,
                                              ),
                                            );
                                        setState(() {});
                                      },
                                      selectedValue: selectedCategory ?? '',
                                    ),
                                  ),
                                ),
                                title: filterCategory,
                              ),
                            ],
                          );
                        },
                        orElse: () => Container(),
                      );
                    },
                  );
                },
                orElse: () => Container(),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          GlTabBarWidget(
            tabController: _tabController,
            tabBarItem1: 'Все сообщества',
            tabBarItem2: 'Управляемые',
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                BeutyList.beautyList(),
                MyBeutyList.beautyList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
