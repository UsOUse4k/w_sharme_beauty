import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/features/auth/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/post/presentation/bloc/repost_users_bloc/repost_users_bloc.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_user_avatar_name.dart';

class PostRepostListUser extends StatelessWidget {
  const PostRepostListUser({
    super.key,
    required this.users,
  });
  final List<UserProfile> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final user = users.elementAt(index);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PostUserAvatarName(
              username: user.username ?? '',
              avatar: user.profilePictureUrl ?? '',
            ),
            RoundCheckbox(
              onChanged: (bool? value) {
                if (value != null) {
                  context.read<RepostUsersBloc>().add(
                        RepostUsersEvent.addUserdIds(
                          user.uid.toString(),
                        ),
                      );
                }
              },
              isChecked: false,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const Gap(20),
      itemCount: users.length,
    );
  }
}
