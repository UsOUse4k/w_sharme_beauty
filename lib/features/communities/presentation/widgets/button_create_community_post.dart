import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/utils/show_warning_dialog.dart';
import 'package:w_sharme_beauty/features/communities/domain/entities/community/entities.dart';
import 'package:w_sharme_beauty/features/post/presentation/widgets/post_card_widget.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class ButtonCreateCommutityPost extends StatelessWidget {
  const ButtonCreateCommutityPost({
    super.key,
    required this.communityId,
    required this.community,
  });

  final String communityId;
  final Community community;

  @override
  Widget build(BuildContext context) {
    final currentUid = firebaseAuth.currentUser!.uid;
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (community.uid == currentUid) {
            context.push(
              '/communities/community-profile/$communityId/community-add-public/$communityId',
            );
          } else {
            showMyDialog(context, 'У вас нет права!');
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.icons.add.path,
              color: AppColors.purple,
              width: 20.w,
              height: 20.h,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Опубликовать",
              style: TextStyle(
                color: AppColors.purple,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
