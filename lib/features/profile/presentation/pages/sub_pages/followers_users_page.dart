import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/user_detail_bloc/user_detail_bloc.dart';

class FollowersUsersPage extends StatefulWidget {
  const FollowersUsersPage({super.key, required this.userId});
  final String userId;

  @override
  State<FollowersUsersPage> createState() => _FollowersUsersPageState();
}

class _FollowersUsersPageState extends State<FollowersUsersPage> {
  @override
  void initState() {
    context.read<UserDetailBloc>().add(
          UserDetailEvent.getUserDetail(
            userId: widget.userId,
          ),
        );
    context.read<GetAllUsersBloc>().add(const GetAllUsersEvent.getAllUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Подписчиков',
          textStyle: AppStyles.w500f22,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 15),
              SearchWidget(
                onChanged: (value) {
                  context
                      .read<GetAllUsersBloc>()
                      .add(GetAllUsersEvent.searchUsers(query: value));
                },
              ),
              CustomContainer(
                child: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                  builder: (context, userState) {
                    return userState.maybeWhen(
                      success: (users) {
                        return BlocBuilder<UserDetailBloc,
                            UserDetailState>(
                          builder: (context, state) {
                            
                            return state.maybeWhen(
                              success: (data) {
                                
                                final filterUsers = users
                                    .where(
                                      (element) =>
                                          data.followers!.contains(element.uid),
                                    )
                                    .toList();
                                filterUsers.sort(
                                  (a, b) => a.username!.compareTo(b.username!),
                                );
                                return ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return NotificationBookingCard(
                                      user: filterUsers[index],
                                      onPressed: () {
                                        //context.push('/home/profilePersonPage/${widget.userId}/followers/${widget.userId}/profilePersonPage/${filterUsers[index].uid}');
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 10.h),
                                  itemCount: filterUsers.length,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
