import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/features/question/domain/entities/entities.dart';
import 'package:w_sharme_beauty/features/question/presentation/widgets/questiowidget_with_column_and_list_tile.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({super.key, required this.questions});

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return QuestionWidgetWithColumnAndListTile(
            question: questions[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: questions.length,
      ),
    );
  }
}
