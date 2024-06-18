import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/gl_button.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/blocs/select_categories/select_categories_cubit.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/utils/advert_modal_bottom_sheet.dart';
import 'package:w_sharme_beauty/features/profile/data/local_category_data.dart';

class CategoriesModalBottomSheet extends StatelessWidget {
  const CategoriesModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvertModalBottomSheet(
      title: "Категории",
      child: BlocBuilder<SelectCategoriesCubit, SelectCategoriesState>(
        builder: (context, state) {
          return Column(
            children: [
              for (int index = 0; index < categoryList.length; index++) ...[
                GestureDetector(
                  onTap: () {
                    context
                        .read<SelectCategoriesCubit>()
                        .categorySelected(categoryList[index]);
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
                              width:
                                  state.categories.contains(categoryList[index])
                                      ? 6
                                      : 1,
                              color: AppColors.purple,
                            ),
                          ),
                        ),
                        const Gap(12),
                        Text(
                          categoryList[index],
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
                text: 'Применить',
                onPressed: () {
                  Navigator.of(context).pop(state.categories);
                },
              ),
              const Gap(20),
            ],
          );
        },
      ),
    );
  }
}
