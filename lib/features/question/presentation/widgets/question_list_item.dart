import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';

final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

class QuestionListItem extends StatelessWidget {
  const QuestionListItem({
    super.key,
    this.questionText,
    this.category,
    this.imageUrl,
    this.onPressed,
    required this.question,
    this.index,
    this.show = "hide",
    this.onPressedOutput,
  });
  final Question question;
  final String? questionText;
  final String? category;
  final String? imageUrl;
  final Function()? onPressed;
  final int? index;
  final String? show;
  final Function()? onPressedOutput;

  @override
  Widget build(BuildContext context) {
    final avatar = question.avatarUrl;
    final Timestamp timestamp = question.createdAt!;
    final String formattedDate = formatDateTime(timestamp);

    return GestureDetector(
      onTap: onPressedOutput,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: GestureDetector(
                onTap: onPressed,
                child: GlCircleAvatar(
                  avatar: avatar.toString(),
                  width: 50.w,
                  height: 50.h,
                  key: ValueKey(question.questionId),
                ),
              ),
              title: Text(
                question.username.toString(),
                style: AppStyles.w500f18.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question.questionText.toString(),
                    style: AppStyles.w400f16,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  formattedDate,
                  style: AppStyles.w400f14.copyWith(color: AppColors.grey),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: onPressedOutput,
                  child: Text(
                    "ответить",
                    style: AppStyles.w400f14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
