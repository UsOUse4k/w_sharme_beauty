import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/communities/presentation/bloc/community_category_bloc/community_category_bloc.dart';

class CommunityCategoryBottomSheet extends StatelessWidget {
  const CommunityCategoryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Чем вы занимаетесь?',
              style: AppStyles.w500f16.copyWith(color: AppColors.darkGrey),
            ),
          ),
          subtitle: state.maybeWhen(
            success: (categories) {
              final categoryTitle = categories
                  .map(
                    (e) => e.title,
                  )
                  .toList();
              return InkWell(
                onTap: () {
                  BottomSheetUtil.showAppBottomSheet(
                    context,
                    CustomBottomSheetLeading(
                      maxHeight: 0.5,
                      navbarTitle: 'Чем вы занимаетесь?',
                      widget: BlocBuilder<CommunityCategoryBloc,
                          CommunityCategoryState>(
                        builder: (context, state) {
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10.h),
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: categoryTitle.length,
                            itemBuilder: (context, index) {
                              final bool isSelected = state.selectedTitle
                                  .contains(categoryTitle[index]);
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                child: Row(
                                  key: ValueKey(categoryTitle[index]),
                                  children: [
                                    RoundCheckbox(
                                      isChecked: isSelected,
                                      onChanged: (bool? value) {
                                        if (value != null) {
                                          context
                                              .read<CommunityCategoryBloc>()
                                              .add(
                                                CommunityCategoryEvent
                                                    .toggleUserSelection(
                                                  categoryTitle[index]
                                                      .toString(),
                                                ),
                                              );
                                        }
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      categoryTitle[index].toString(),
                                      style: AppStyles.w500f18,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<CommunityCategoryBloc, CommunityCategoryState>(
                        builder: (context, listState) {
                          return Flexible(
                            child: Text(
                              listState.selectedTitle.isNotEmpty
                                  ? listState.selectedTitle.join(', ')
                                  : 'Выберите категории',
                              style: AppStyles.w500f16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        },
                      ),
                      const Icon(
                        Icons.arrow_drop_down_outlined,
                        color: AppColors.darkGrey,
                      ),
                    ],
                  ),
                ),
              );
            },
            orElse: () => null,
          ),
        );
      },
    );
  }
}
