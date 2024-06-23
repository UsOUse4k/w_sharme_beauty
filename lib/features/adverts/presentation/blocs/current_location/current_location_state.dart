part of 'current_location_bloc.dart';

@freezed
class CurrentLocationState with _$CurrentLocationState {
  const factory CurrentLocationState.initial() = _Initial;
  const factory CurrentLocationState.loading() = _Loading;
  const factory CurrentLocationState.loadFailure(String message) =
      _PemissionsDenied;
  const factory CurrentLocationState.loadSuccess((double, double) position) =
      _Loaded;
}
