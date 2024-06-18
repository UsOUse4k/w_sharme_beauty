import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'adverts_filter_state.dart';
part 'adverts_filter_cubit.freezed.dart';

@lazySingleton
class AdvertsFilterCubit extends Cubit<AdvertsFilterState> {
  AdvertsFilterCubit() : super(AdvertsFilterState.initial());

  void categorySelected(String? category) {
    emit(
      state.copyWith(
        category: category,
      ),
    );
  }

  void ratingSelected(double? rating) {
    emit(
      state.copyWith(
        rating: rating,
      ),
    );
  }

  void workTimeSelected(WorkTime? workTime) {
    emit(
      state.copyWith(
        workTime: workTime,
      ),
    );
  }

  void distanceSelected(Distance? distance) {
    emit(
      state.copyWith(
        distance: distance,
      ),
    );
  }
}
