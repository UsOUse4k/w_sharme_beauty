// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/utils/bottom_sheet_util.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/category/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:w_sharme_beauty/features/chat_group/presentation/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/profile/presentation/bloc/category_list_bloc/category_list_bloc.dart';

class CategoryBottomSheet extends StatelessWidget {
  const CategoryBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
                      widget: BlocBuilder<CategoryListBloc, CategoryListState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10.h),
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: categoryTitle.length,
                                itemBuilder: (context, index) {
                                  final bool isSelected = state.selectedTitle
                                      .contains(categoryTitle[index]);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18,),
                                    child: Row(
                                      key: ValueKey(categoryTitle[index]),
                                      children: [
                                        RoundCheckbox(
                                          isChecked: isSelected,
                                          onChanged: (bool? value) {
                                            if (value != null) {
                                              context
                                                  .read<CategoryListBloc>()
                                                  .add(
                                                    CategoryListEvent
                                                        .toggleUserSelection(
                                                      categoryTitle[index]!,
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
                              ),
                              
                              Container(
                                margin: const EdgeInsets.only(top: 50),
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                child: GlButton(
                                  text: 'Ок',
                                  onPressed: () {
                                    context.pop();
                                  },
                                ),
                              ),
                            ],
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<CategoryListBloc, CategoryListState>(
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
