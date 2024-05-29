import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/questiowidget_with_column_and_list_tile.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({super.key, required this.questions});

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = questions[index];
        return QuestionWidgetWithColumnAndListTile(
          question: item,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: questions.length,
    );
  }
}
