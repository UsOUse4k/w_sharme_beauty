import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'current_location_event.dart';
part 'current_location_state.dart';
part 'current_location_bloc.freezed.dart';

@injectable
class CurrentLocationBloc
    extends Bloc<CurrentLocationEvent, CurrentLocationState> {
  CurrentLocationBloc() : super(const CurrentLocationState.initial()) {
    on<Started>(
      (event, emit) async {
        emit(const CurrentLocationState.loading());

        bool serviceEnabled;
        LocationPermission permission;

        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          emit(
            const CurrentLocationState.loadFailure(
              "Службы определения местоположения отключены.",
            ),
          );
          return;
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            emit(
              const CurrentLocationState.loadFailure(
                "Разрешения на определение местоположения запрещены.",
              ),
            );
            return;
          }
        }

        if (permission == LocationPermission.deniedForever) {
          emit(
            const CurrentLocationState.loadFailure(
              "Разрешения на определение местоположения навсегда запрещены, мы не можем запрашивать разрешения.",
            ),
          );
          return;
        }

        await emit.forEach(
          Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,
            ),
          ),
          onData: (position) {
            return CurrentLocationState.loadSuccess(
              (
                position.latitude,
                position.longitude,
              ),
            );
          },
        );
      },
    );
  }
}
