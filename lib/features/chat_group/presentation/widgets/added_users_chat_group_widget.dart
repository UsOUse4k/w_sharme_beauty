// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/search_widget.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/bloc/added_chat_users_group_bloc/added_chat_users_group_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class AddedUsersChatGroupWidget extends StatelessWidget {
  const AddedUsersChatGroupWidget({
    super.key,
    required this.users,
    required this.communityId,
  });

  final List<UserProfile> users;
  final String communityId;

  @override
  Widget build(BuildContext context) {
    final filterUsers =
        users.where((e) => e.uid != firebaseAuth.currentUser!.uid).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<AddedChatUsersGroupBloc, AddedChatUsersGroupState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(),
              const SizedBox(height: 10),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => _buildUserCardRow(
                    index,
                    state.selectedUsers,
                    context,
                  ),
                  separatorBuilder: (bContext, x) {
                    return const SizedBox(width: 20);
                  },
                  itemCount: state.selectedUsers.length,
                  // shrinkWrap: true,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 240,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => _buildCheckboxUserCard(
                    index,
                    state.selectedUsers,
                    context,
                    filterUsers,
                  ),
                  separatorBuilder: (buildContext, y) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: filterUsers.length,
                ),
              ),
              const SizedBox(height: 20),
              GlButton(
                text: 'Продолжить',
                onPressed: () {
                  if (state.selectedUsers.isNotEmpty) {
                    BottomSheetUtil.showAppBottomSheet(
                      context,
                      CustomBottomSheetLeading(
                        maxHeight: 0.6,
                        navbarTitle: "Создать группу",
                        widget: CreateChatGroupWidget(
                          users: state.selectedUsers,
                          communityId: communityId,
                        ),
                      ),
                      closeCurrent: true,
                    );
                  } else {
                    showMyDialog(
                      context,
                      'Вы должны добавить хотя бы одного пользователя, чтобы продолжить.',
                    );
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Row _buildCheckboxUserCard(
    int index,
    List<UserProfile> selectedUsers,
    BuildContext context,
    List<UserProfile> filterUsers,
  ) {
    final user = filterUsers[index];
    final bool isSelected = selectedUsers.contains(user);
    return Row(
      //key: ValueKey(user.uid),
      children: [
        RoundCheckbox(
          isChecked: isSelected,
          onChanged: (bool? value) {
            if (value != null) {
              context
                  .read<AddedChatUsersGroupBloc>()
                  .add(AddedChatUsersGroupEvent.toggleSelectedUsers(user));
            }
          },
        ),
        const SizedBox(width: 10),
        if (user.profilePictureUrl != '')
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: GlCachedNetworImage(
              height: 50.h,
              width: 50.w,
              urlImage: user.profilePictureUrl,
            ),
          )
        else
          SizedBox(
            width: 50.w,
            height: 50.h,
            child: const CircleAvatar(
              backgroundColor: AppColors.grey,
              child: Icon(
                Icons.image_not_supported_outlined,
              ),
            ),
          ),
        const SizedBox(width: 10),
        Text(
          user.username.toString(),
          style: AppStyles.w500f18,
        ),
      ],
    );
  }

  Column _buildUserCardRow(
    int index,
    List<UserProfile> selectedUsers,
    BuildContext context,
  ) {
    final user = selectedUsers[index];
    return Column(
      children: [
        SizedBox(
          width: 50.w,
          height: 50.h,
          child: Stack(
            children: [
              if (user.profilePictureUrl != '')
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: GlCachedNetworImage(
                    width: 50.w,
                    height: 50.w,
                    urlImage: user.profilePictureUrl,
                  ),
                )
              else
                const CircleAvatar(
                  backgroundColor: AppColors.grey,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                  ),
                ),
              Positioned(
                left: 0,
                top: 0,
                child: InkWell(
                  onTap: () => context
                      .read<AddedChatUsersGroupBloc>()
                      .add(AddedChatUsersGroupEvent.toggleSelectedUsers(user)),
                  child: Assets.images.close.image(
                    width: 14.w,
                    height: 14.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.username.toString(),
          style: AppStyles.w500f18,
        ),
      ],
    );
  }
}
