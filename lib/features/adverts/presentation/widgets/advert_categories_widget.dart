import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/adverts_filter/adverts_filter_cubit.dart';
import 'package:w_sharme_beauty/gen/assets.gen.dart';

class Category {
  final String name;
  final String imagePath;

  Category({
    required this.name,
    required this.imagePath,
  });
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      Category(
        name: 'Маникюр',
        imagePath: Assets.images.manicure.path,
      ),
      Category(
        name: 'Педикюр',
        imagePath: Assets.images.pedicure.path,
      ),
      Category(
        name: 'Брови',
        imagePath: Assets.images.brows.path,
      ),
      Category(
        name: 'Ресницы',
        imagePath: Assets.images.eyelashes.path,
      ),
      Category(
        name: 'Стрижка',
        imagePath: Assets.images.haircut.path,
      ),
    ];

    return BlocBuilder<AdvertsFilterCubit, AdvertsFilterState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int index = 0; index < categories.length; index++) ...[
                GestureDetector(
                  onTap: () {
                    context.read<AdvertsFilterCubit>().categorySelected(
                          state.category != categories[index].name
                              ? categories[index].name
                              : null,
                        );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 56.5,
                        height: 56.5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: state.category != null
                              ? state.category == categories[index].name
                                  ? AppColors.purple
                                  : null
                              : null,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.purple,
                            width: 1.2,
                          ),
                        ),
                        child: Image.asset(
                          categories[index].imagePath,
                          color: state.category != null
                              ? state.category == categories[index].name
                                  ? AppColors.white
                                  : null
                              : null,
                        ),
                      ),
                      const Gap(7),
                      Text(
                        categories[index].name,
                        style: AppStyles.w400f12.copyWith(
                          color: state.category != null
                              ? state.category == categories[index].name
                                  ? AppColors.purple
                                  : null
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
                if (index < categories.length - 1) const Gap(20),
              ],
            ],
          ),
        );
      },
    );
  }
}
