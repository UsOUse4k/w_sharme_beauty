import 'package:geolocator/geolocator.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/calculate_distance.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/current_location.dart';

Future<double> getDistanceToLocation((double, double) destination) async {
  try {
    final Position position = await getCurrentLocation();
    final double distanceInKm = calculateDistance(
      (
        position.latitude,
        position.longitude,
      ),
      (
        destination.$1,
        destination.$2,
      ),
    );
    return distanceInKm;
  } catch (e) {
    return -1;
  }
}
