import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';

class DistanceModalBottomSheet extends StatefulWidget {
  const DistanceModalBottomSheet({super.key});

  @override
  State<DistanceModalBottomSheet> createState() =>
      _DistanceModalBottomSheetState();
}

class _DistanceModalBottomSheetState extends State<DistanceModalBottomSheet> {
  Distance? selectedDistance;

  @override
  void initState() {
    super.initState();

    selectedDistance = context.read<AdvertsFilterCubit>().state.distance;
  }

  @override
  Widget build(BuildContext context) {
    const distances = Distance.values;

    return AdvertModalBottomSheet(
      title: "Расстояние",
      child: Column(
        children: [
          for (int index = 0; index < distances.length; index++) ...[
            GestureDetector(
              onTap: () {
                selectedDistance = selectedDistance != distances[index]
                    ? distances[index]
                    : null;

                setState(() {});
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
                          width: selectedDistance != null
                              ? selectedDistance == distances[index]
                                  ? 6
                                  : 1
                              : 1,
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                    const Gap(12),
                    Text(
                      distances[index].present(),
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
              context
                  .read<AdvertsFilterCubit>()
                  .distanceSelected(selectedDistance);
              Navigator.of(context).pop();
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
