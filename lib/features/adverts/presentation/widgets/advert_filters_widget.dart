import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_distance_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_filter_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_rating_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/advert_work_time_modal_bottom_sheet.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertsFilterCubit, AdvertsFilterState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterButton(
                onTap: () {
                  showAdvertModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.read<AdvertsFilterCubit>(),
                        child: const RatingModalBottomSheet(),
                      );
                    },
                  );
                },
                title: state.rating != null
                    ? "Не ниже ★ ${state.rating.toString().replaceAll(".", ",")}"
                    : "Рейтинг",
              ),
              const Gap(12),
              FilterButton(
                onTap: () {
                  showAdvertModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.read<AdvertsFilterCubit>(),
                        child: const DistanceModalBottomSheet(),
                      );
                    },
                  );
                },
                title: state.distance?.present() ?? "Расстояние",
              ),
              const Gap(12),
              FilterButton(
                onTap: () {
                  showAdvertModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return BlocProvider.value(
                        value: context.read<AdvertsFilterCubit>(),
                        child: const WorkTimeModalBottomSheet(),
                      );
                    },
                  );
                },
                title: state.workTime?.present() ?? "Время работы/Приема",
              ),
            ],
          ),
        );
      },
    );
  }
}
