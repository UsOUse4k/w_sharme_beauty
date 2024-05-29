import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/presentation/bloc/get_all_users_bloc/get_all_users_bloc.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/home/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/my_profile_info_bloc/my_profile_info_bloc.dart';

class SubscriptionsUsersPage extends StatelessWidget {
  const SubscriptionsUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlAppBar(
        leading: GlIconButton(
          iconSize: 16,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: CenterTitleAppBar(
          title: 'Участники сообщества',
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
                        return BlocBuilder<MyProfileInfoBloc,
                            MyProfileInfoState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              succes: (data) {
                                final filterUsers = users
                                    .where(
                                      (element) => data.subscriptions!
                                          .contains(element.uid),
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
