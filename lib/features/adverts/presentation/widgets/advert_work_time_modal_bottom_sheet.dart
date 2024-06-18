import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';

class WorkTimeModalBottomSheet extends StatefulWidget {
  const WorkTimeModalBottomSheet({super.key});

  @override
  State<WorkTimeModalBottomSheet> createState() =>
      _WorkTimeModalBottomSheetState();
}

class _WorkTimeModalBottomSheetState extends State<WorkTimeModalBottomSheet> {
  WorkTime? selectedWorkTime;

  @override
  void initState() {
    super.initState();

    selectedWorkTime = context.read<AdvertsFilterCubit>().state.workTime;
  }

  @override
  Widget build(BuildContext context) {
    const workTimes = WorkTime.values;

    return AdvertModalBottomSheet(
      title: "Время работы/Приема",
      child: Column(
        children: [
          for (int index = 0; index < workTimes.length; index++) ...[
            GestureDetector(
              onTap: () {
                selectedWorkTime = selectedWorkTime != workTimes[index]
                    ? workTimes[index]
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
                          width: selectedWorkTime != null
                              ? selectedWorkTime == workTimes[index]
                                  ? 6
                                  : 1
                              : 1,
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                    const Gap(12),
                    Text(
                      workTimes[index].present(),
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
                  .workTimeSelected(selectedWorkTime);
              Navigator.of(context).pop();
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
