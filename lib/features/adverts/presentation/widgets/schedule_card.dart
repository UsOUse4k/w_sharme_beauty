import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/gen/fonts.gen.dart';

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    super.key,
    required this.text,
    this.onFromTimeChanged,
    this.onToTimeChanged,
    this.defaultFromDateTime,
    this.defaultToDateTime,
  });

  final String text;
  final ValueChanged<String>? onFromTimeChanged;
  final ValueChanged<String>? onToTimeChanged;
  final String? defaultFromDateTime;
  final String? defaultToDateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$text:",
          style: AppStyles.w500f18.copyWith(color: AppColors.darkGrey),
        ),
        const Spacer(),
        Row(
          children: [
            TimePicker(
              defaultDateTime: defaultFromDateTime != null
                  ? DateFormat("HH:mm").parse(defaultFromDateTime!)
                  : null,
              onTimeChanged: (value) {
                onFromTimeChanged?.call(DateFormat("HH:mm").format(value));
              },
            ),
            const Gap(5),
            const Text("-"),
            const Gap(5),
            TimePicker(
              defaultDateTime: defaultToDateTime != null
                  ? DateFormat("HH:mm").parse(defaultToDateTime!)
                  : null,
              onTimeChanged: (value) {
                onToTimeChanged?.call(DateFormat("HH:mm").format(value));
              },
            ),
          ],
        ),
      ],
    );
  }
}

class TimePicker extends StatefulWidget {
  const TimePicker({
    super.key,
    this.onTimeChanged,
    this.defaultDateTime,
  });

  final ValueChanged<DateTime>? onTimeChanged;
  final DateTime? defaultDateTime;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();

    dateTime = widget.defaultDateTime ??
        DateTime.now().copyWith(
          hour: 0,
          minute: 0,
        );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showAdvertModalBottomSheet<DateTime>(
          context: context,
          builder: (context) {
            return TimePickerBottomSheet(
              defaultDateTime: dateTime,
            );
          },
        ).then(
          (value) {
            if (value != null) {
              dateTime = value;

              widget.onTimeChanged?.call(dateTime);

              setState(() {});
            }
          },
        );
      },
      child: Container(
        width: 120,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          DateFormat("HH:mm").format(dateTime),
          style: AppStyles.w500f16.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}

class TimePickerBottomSheet extends StatelessWidget {
  const TimePickerBottomSheet({super.key, this.defaultDateTime});

  final DateTime? defaultDateTime;

  @override
  Widget build(BuildContext context) {
    late DateTime dateTime;

    return AdvertModalBottomSheet(
      title: "Выберите время",
      child: Column(
        children: [
          const Gap(18),
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TimePickerSpinner(
              time: defaultDateTime,
              alignment: Alignment.center,
              minutesInterval: 5,
              isForce2Digits: true,
              normalTextStyle: const TextStyle(
                fontFamily: FontFamily.gTEastiProDisplay,
                fontSize: 26,
                color: AppColors.darkGrey,
              ),
              highlightedTextStyle: const TextStyle(
                fontFamily: FontFamily.gTEastiProDisplay,
                fontSize: 28,
              ),
              onTimeChange: (value) {
                dateTime = value;
              },
            ),
          ),
          const Gap(20),
          GlButton(
            text: 'Применить',
            onPressed: () {
              Navigator.pop(context, dateTime);
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
