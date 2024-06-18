import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

Future<T?> showAdvertModalBottomSheet<T>({
  bool useRootNavigator = true,
  bool enableDrag = false,
  required BuildContext context,
  required WidgetBuilder builder,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    useRootNavigator: useRootNavigator,
    isScrollControlled: true,
    enableDrag: enableDrag,
    builder: builder,
  );
}

class AdvertModalBottomSheet extends StatelessWidget {
  const AdvertModalBottomSheet({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Text(
                    title,
                    style: AppStyles.w700f18.copyWith(),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Assets.svgs.close.svg(),
                  ),
                ],
              ),
            ),
            const Gap(15),
            const Divider(
              height: 0,
              color: AppColors.lightGrey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
