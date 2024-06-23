import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/current_location/current_location_bloc.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/calculate_distance.dart';

class DistanceWidget extends StatelessWidget {
  final (double, double) destination;

  const DistanceWidget({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocationBloc, CurrentLocationState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (state) {
            final current = state.position;

            final distance = calculateDistance(current, destination);

            return Text(
              "${distance.toStringAsFixed(2)} км",
              style: AppStyles.w400f14.copyWith(
                color: AppColors.darkGrey,
              ),
            );
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
