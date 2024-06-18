import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:w_sharme_beauty/features/adverts/domain/advert.dart';

part 'select_schedule_state.dart';
part 'select_schedule_cubit.freezed.dart';

@injectable
class SelectScheduleCubit extends Cubit<SelectScheduleState> {
  SelectScheduleCubit() : super(SelectScheduleState.initial());

  void initialize(List<Time> schedule) {
    emit(state.copyWith(schedule: schedule));
  }

  void changeTime(Weekday day, String from, String to) {
    final schedule = state.schedule.map(
      (time) {
        return time.day == day
            ? time.copyWith(
                from: from,
                to: to,
              )
            : time;
      },
    ).toList();

    emit(state.copyWith(schedule: schedule));
  }
}
