part of 'adverts_filter_cubit.dart';

enum WorkTime {
  aroundClock,
  open;

  String present() => switch (this) {
        WorkTime.aroundClock => "Круглосуточно",
        WorkTime.open => "Открыто",
      };
}

enum Distance {
  near,
  fiveKm,
  tenKm;

  String present() => switch (this) {
        Distance.near => "Рядом",
        Distance.fiveKm => "В 5 км от меня",
        Distance.tenKm => "В 10 км от меня",
      };
}

@freezed
class AdvertsFilterState with _$AdvertsFilterState {
  const factory AdvertsFilterState({
    String? category,
    double? rating,
    WorkTime? workTime,
    Distance? distance,
  }) = _AdvertsFilterState;

  factory AdvertsFilterState.initial() => const AdvertsFilterState();
}
