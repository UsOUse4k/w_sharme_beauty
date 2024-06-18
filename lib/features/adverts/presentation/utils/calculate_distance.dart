import 'dart:math';

double calculateDistance(
  (double, double) startCoordinates,
  (double, double) endCoordinates,
) {
  const earthRadius = 6371; // Earth's radius in kilometers

  final startLat = startCoordinates.$1 * (pi / 180);
  final startLng = startCoordinates.$2 * (pi / 180);
  final endLat = endCoordinates.$1 * (pi / 180);
  final endLng = endCoordinates.$2 * (pi / 180);

  final dLat = endLat - startLat;
  final dLng = endLng - startLng;

  final a = sin(dLat / 2) * sin(dLat / 2) +
      cos(startLat) * cos(endLat) * sin(dLng / 2) * sin(dLng / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadius * c;
}
