import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
              for (int index = 0; index < Weekday.values.length; index++) ...[
                ScheduleCard(
                  text: Weekday.values[index].present(),
                  defaultFromDateTime: state.schedule[index].from,
                  defaultToDateTime: state.schedule[index].to,
                  onFromTimeChanged: (value) {
                    context.read<SelectScheduleCubit>().changeTime(
                          Weekday.values[index],
                          value,
                          state.schedule[index].to,
                        );
                  },
                  onToTimeChanged: (value) {
                    context.read<SelectScheduleCubit>().changeTime(
                          Weekday.values[index],
                          state.schedule[index].from,
                          value,
                        );
                  },
                ),
                if (index < Weekday.values.length - 1) const Gap(15),
              ],
              const Gap(20),
              GlButton(
                text: 'Применить',
                onPressed: () {
                  Navigator.of(context).pop(state.schedule);
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
