import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/distance_to_location.dart';

class DistanceWidget extends StatefulWidget {
  final (double, double) destination;

  const DistanceWidget({
    super.key,
    required this.destination,
  });

  @override
  _DistanceWidgetState createState() => _DistanceWidgetState();
}

class _DistanceWidgetState extends State<DistanceWidget> {
  double? _distance;

  @override
  void initState() {
    super.initState();
    _calculateDistance().then(
      (value) {
        setState(() {
          _distance = value;
        });
      },
    );
  }

  Future<double> _calculateDistance() async {
    final double distance = await getDistanceToLocation(
      (
        widget.destination.$1,
        widget.destination.$2,
      ),
    );
    return distance;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${_distance == null ? "-" : _distance!.toStringAsFixed(2)} км",
      style: AppStyles.w400f14.copyWith(
        color: AppColors.darkGrey,
      ),
    );
  }
}
