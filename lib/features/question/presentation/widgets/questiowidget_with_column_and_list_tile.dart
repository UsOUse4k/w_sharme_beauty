import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/di/injector.dart';

import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/format_date/format_date_ago.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/question.dart';

final FirebaseAuth firebaseAuth = getIt<FirebaseAuth>();

class QuestionWidgetWithColumnAndListTile extends StatefulWidget {
  const QuestionWidgetWithColumnAndListTile({
    super.key,
    this.questionText,
    this.category,
    this.imageUrl,
    this.onPressed,
    //  this.username,
    required this.question,
    this.index,
    this.show = "hide",
  });
  //final String? username;
  final Question question;
  final String? questionText;
  final String? category;
  final String? imageUrl;
  final Function()? onPressed;
  final int? index;
  final String? show;

  @override
  State<QuestionWidgetWithColumnAndListTile> createState() =>
      _QuestionWidgetWithColumnAndListTileState();
}

class _QuestionWidgetWithColumnAndListTileState
    extends State<QuestionWidgetWithColumnAndListTile> {
  bool isLike = false;
  int countLike = 0;

  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = widget.question.createdAt!;
    final String formattedDate = formatDateTime(timestamp);
    final Function()? onTap = widget.onPressed;
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(23)),
            child: GlCachedNetworImage(
              urlImage: widget.question.imageUrl,
              width: 46.w,
              height: 46.h,
            ),
          ),
          title: Text(
            widget.question.username.toString(),
            style: AppStyles.w500f16.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.question.questionText.toString(),
                style: AppStyles.w400f13,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              formattedDate,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: onTap,
              child: const Text(
                "ответить",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
