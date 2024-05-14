// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/domain/entities/message.dart';

class CardMessageWidget extends StatelessWidget {
  const CardMessageWidget({
    super.key,
    this.username,
    required this.message,
    required this.date,
    this.avatar,
    required this.check,
    this.seen,
    this.data,
  });

  final String? username;
  final String message;
  final String date;
  final String? avatar;
  final bool check;
  final bool? seen;
  final Message? data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          check ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!check)
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GlCachedNetworImage(
              height: 30.h,
              width: 30.w,
              urlImage: avatar,
            ),
          )
        else
          seen != null && seen == true
              ? const Icon(
                  Icons.done_all,
                  size: 16,
                  color: AppColors.purple,
                )
              : const Icon(
                  Icons.check,
                  size: 16,
                ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment:
              check ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.75,
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: check ? AppColors.purple : AppColors.lightGrey,
                borderRadius: check
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!check && username != null)
                    Text(
                      username!,
                      style:
                          AppStyles.w500f16.copyWith(color: AppColors.purple),
                    ),
                  if (data != null && data!.image != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 260.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                data!.image.toString(),
                              ),
                              
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          message,
                          style: AppStyles.w500f16.copyWith(
                            color: check ? AppColors.white : AppColors.black,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      message,
                      style: AppStyles.w500f16.copyWith(
                        color: check ? AppColors.white : AppColors.black,
                      ),
                    ),
                ],
              ),
            ),
            Text(
              date,
              textAlign: TextAlign.end,
              style: AppStyles.w400f13
                  .copyWith(color: AppColors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
