import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/features/category/domain/entities/category.dart';
import 'package:w_sharme_beauty/features/category/presentation/widgets/category_item.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key, required this.category, this.onFilterCategories});
  final List<Category> category;
  final Function(Category)? onFilterCategories;

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int? selectedActiveIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: widget.category.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = widget.category[index];
            return CategoryItem(
              imageUrl: item.image.toString(),
              title: item.title.toString(),
              onPressed: () {
                widget.onFilterCategories!(item);
                setState(() {
                  selectedActiveIndex = index;
                });
              },
              color: selectedActiveIndex == index
                  ? AppColors.purple
                  : AppColors.black,
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 15.w,),
        ),
      ),
    );
  }
}
