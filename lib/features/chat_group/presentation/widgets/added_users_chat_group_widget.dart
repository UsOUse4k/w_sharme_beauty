import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/custom_bottom_sheet_leading.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/search_widget.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class AddedUsersChatGroupWidget extends StatefulWidget {
  const AddedUsersChatGroupWidget({
    super.key,
    required this.users,
  });

  final List<UserProfile> users;

  @override
  State<AddedUsersChatGroupWidget> createState() =>
      _AddedUsersChatGroupWidgetState();
}

class _AddedUsersChatGroupWidgetState extends State<AddedUsersChatGroupWidget> {
  List<UserProfile> selectedUsers = [];

  void toggleUserSelection(UserProfile user) {
    setState(() {
      if (selectedUsers.contains(user)) {
        selectedUsers.remove(user);
      } else {
        selectedUsers.add(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
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
                selectedUsers,
              ),
              separatorBuilder: (bContext, x) {
                return const SizedBox(width: 20);
              },
              itemCount: selectedUsers.length,
              // shrinkWrap: true,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 240,
            child: ListView.separated(
              itemBuilder: (context, index) => _buildCheckboxUserCard(index),
              separatorBuilder: (buildContext, y) {
                return const SizedBox(height: 10);
              },
              itemCount: widget.users.length,
            ),
          ),
          const SizedBox(height: 20),
          GlButton(
            text: 'Продолжить',
            onPressed: () {
              if (selectedUsers.isNotEmpty) {
                BottomSheetUtil.showAppBottomSheet(
                  context,
                  CustomBottomSheetLeading(
                    maxHeight: 0.6,
                    navbarTitle: "Создать группу",
                    widget: CreateChatGroupWidget(
                      users: selectedUsers,
                    ),
                  ),
                );
              } else {
                _showMyDialog();
              }
            },
          ),
        ],
      ),
    );
  }

  Row _buildCheckboxUserCard(int index) {
    final user = widget.users[index];
    final bool isSelected = selectedUsers.contains(user);
    return Row(
      key: ValueKey(user.uid),
      children: [
        RoundCheckbox(
          isChecked: isSelected,
          onChanged: (bool? value) {
            if (value != null) {
              toggleUserSelection(user);
            }
          },
        ),
        const SizedBox(width: 10),
        if (widget.users[index].profilePictureUrl != '')
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: GlCachedNetworImage(
              height: 50.h,
              width: 50.w,
              urlImage: widget.users[index].profilePictureUrl,
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
          widget.users[index].username.toString(),
          style: AppStyles.w500f18,
        ),
      ],
    );
  }

  Column _buildUserCardRow(
    int index,
    List<UserProfile> selectedUsers,
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
                  onTap: () => toggleUserSelection(user),
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

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Предупреждение'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Вы должны добавить хотя бы одного пользователя, чтобы продолжить.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
