part of 'select_schedule_cubit.dart';

@freezed
class SelectScheduleState with _$SelectScheduleState {
  const factory SelectScheduleState({required List<Time> schedule}) = _SelectScheduleState;

  factory SelectScheduleState.initial() => const SelectScheduleState(
        schedule: [
          Time(
            day: Weekday.monday,
            from: "07:00",
            to: "18:00",
          ),
          Time(
            day: Weekday.tuesday,
            from: "07:00",
            to: "18:00",
          ),
          Time(
            day: Weekday.wednesday,
            from: "07:00",
            to: "18:00",
          ),
          Time(
            day: Weekday.thursday,
            from: "07:00",
            to: "18:00",
          ),
          Time(
            day: Weekday.friday,
            from: "07:00",
            to: "18:00",
          ),
          Time(
            day: Weekday.saturday,
            from: "07:00",
            to: "18:00",
          ),
          Time(
            day: Weekday.sunday,
            from: "07:00",
            to: "18:00",
          ),
        ],
      );
}
