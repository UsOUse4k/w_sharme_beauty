import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/questiowidget_with_column_and_list_tile.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({super.key, required this.questions});

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = questions[index];
          return QuestionWidgetWithColumnAndListTile(
            question: item,
            onPressedOutput: () {
              context.push('/question/question-datail/${item.questionId}');
            },
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 15.h),
        itemCount: questions.length,
      ),
    );
  }
}
