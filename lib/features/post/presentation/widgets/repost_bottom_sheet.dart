import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class RepostBottomSheet extends StatefulWidget {
  const RepostBottomSheet({
    super.key,
    required this.postId,
  });

  final String postId;

  @override
  State<RepostBottomSheet> createState() => _RepostBottomSheetState();
}

class _RepostBottomSheetState extends State<RepostBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.7,
      expand: false,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.6,
                      color: AppColors.grey,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Container(
                        height: 4.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      //GridView.builder(
                      //  gridDelegate:SliverGridDelegate,
                      //  itemBuilder: itemBuilder,
                      //)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
