import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';

class RatingModalBottomSheet extends StatefulWidget {
  const RatingModalBottomSheet({super.key});

  @override
  State<RatingModalBottomSheet> createState() => _RatingModalBottomSheetState();
}

class _RatingModalBottomSheetState extends State<RatingModalBottomSheet> {
  double? selectedRating;

  @override
  void initState() {
    super.initState();

    selectedRating = context.read<AdvertsFilterCubit>().state.rating;
  }

  @override
  Widget build(BuildContext context) {
    final ratings = [
      4.9,
      4.7,
      4.5,
      4.0,
      3.5,
      3.0,
    ];

    return AdvertModalBottomSheet(
      title: "Рейтинг",
      child: Column(
        children: [
          for (int index = 0; index < ratings.length; index++) ...[
            GestureDetector(
              onTap: () {
                selectedRating =
                    selectedRating != ratings[index] ? ratings[index] : null;

                setState(() {});
              },
              child: SizedBox(
                height: 46,
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: selectedRating != null
                              ? selectedRating == ratings[index]
                                  ? 6
                                  : 1
                              : 1,
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                    const Gap(12),
                    Text(
                      "Не ниже ★ ${ratings[index].toString().replaceAll(".", ",")}",
                      style: AppStyles.w500f14,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 0,
              indent: 36,
              color: AppColors.lightGrey,
            ),
          ],
          const Gap(20),
          GlButton(
            text: 'Готово',
            onPressed: () {
              context.read<AdvertsFilterCubit>().ratingSelected(selectedRating);
              Navigator.of(context).pop();
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
