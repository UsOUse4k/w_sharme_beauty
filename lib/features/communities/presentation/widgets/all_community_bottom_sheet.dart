import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';

typedef OnSelectCallback = void Function(String text);

class AllCommunityBottomSheet extends StatefulWidget {
  const AllCommunityBottomSheet({
    super.key,
    required this.list,
    required this.onSelect,
    required this.selectedValue,
  });

  final List<String> list;
  final OnSelectCallback onSelect;
  final String selectedValue;

  @override
  State<AllCommunityBottomSheet> createState() =>
      _AllCommunityBottomSheetState();
}

class _AllCommunityBottomSheetState extends State<AllCommunityBottomSheet> {
  String? community;

  @override
  void initState() {
    community = widget.selectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Column(
        children: [
          for (int index = 0; index < widget.list.length; index++) ...[
            GestureDetector(
              onTap: () {
                community =
                    community != widget.list[index] ? widget.list[index] : null;
                setState(() {});
                widget.onSelect(community!);
              },
              child: SizedBox(
                height: 46,
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: community != null
                              ? community == widget.list[index]
                                  ? 6
                                  : 1
                              : 1,
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                    const Gap(12),
                    Text(
                      widget.list[index],
                      style: AppStyles.w500f14,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 0,
              indent: 36,
              color: AppColors.lightGrey,
            ),
          ],
          const Gap(20),
          GlButton(
            text: 'Готово',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
