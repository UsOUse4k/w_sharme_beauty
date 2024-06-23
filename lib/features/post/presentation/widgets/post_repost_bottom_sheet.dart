import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';

class PostRepostBottomSheet extends StatelessWidget {
  const PostRepostBottomSheet({
    super.key,
    this.navbarTitle,
    required this.widget,
    this.maxHeight,
  });

  final String? navbarTitle;
  final Widget widget;
  final double? maxHeight;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: maxHeight ?? 0.4,
      maxChildSize: maxHeight ?? 0.4,
      expand: false,
      
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (navbarTitle != null)
                        Text(
                          navbarTitle!,
                          style: AppStyles.w500f18.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.lightGrey,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: widget,
              ),
              //Text('hihi'),
            ],
          ),
        );
      },
    );
  }
}