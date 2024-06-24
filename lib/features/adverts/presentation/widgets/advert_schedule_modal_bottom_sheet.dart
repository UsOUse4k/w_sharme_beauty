import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_schedule/select_schedule_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/schedule_card.dart';

class ScheduleModalBottomSheet extends StatelessWidget {
  const ScheduleModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvertModalBottomSheet(
      title: "График работы",
      child: BlocBuilder<SelectScheduleCubit, SelectScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              const Gap(18),
              Row(
                children: [
                  Text(
                    "Круглосуточно:",
                    style: AppStyles.w500f18.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const Gap(20),
                  CupertinoSwitch(
                    trackColor: AppColors.purple,
                    activeColor: AppColors.purple,
                    value: state.isAroundClock,
                    onChanged: (value) {
                      context
                          .read<SelectScheduleCubit>()
                          .aroundClockChanged(value);
                    },
                  ),
                ],
              ),
              const Gap(15),
              for (int index = 0; index < state.schedule.length; index++) ...[
                ScheduleCard(
                  text: Weekday.values[index].present(),
                  fromTime: state.schedule[index].from,
                  toTime: state.schedule[index].to,
                  onFromTimeChanged: (value) {
                    context.read<SelectScheduleCubit>().scheduleChanged(
                          value,
                          state.schedule[index].to,
                        );
                  },
                  onToTimeChanged: (value) {
                    context.read<SelectScheduleCubit>().scheduleChanged(
                          state.schedule[index].from,
                          value,
                        );
                  },
                ),
                if (index < state.schedule.length - 1) const Gap(15),
              ],
              const Gap(20),
              GlButton(
                text: 'Применить',
                onPressed: () {
                  Navigator.of(context).pop((state.isAroundClock, state.schedule));
                },
              ),
              const Gap(20),
            ],
          );
        },
      ),
    );
  }
}
