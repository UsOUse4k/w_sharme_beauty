import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/feedback_card_widget.dart';
import 'package:w_sharme_beauty/features/adverts/presentation/widgets/feedbacks_widget.dart';

class AdvertFeedbacksPage extends StatelessWidget {
  const AdvertFeedbacksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: const BoxDecoration(
              color: AppColors.white,
            ),
            child: const FeedbacksWidget(
              title: "Отзывы",
              rating: '5.0',
              marks: '722 оценки',
            ),
          ),
          const SizedBox(height: 15),
          FeedbackCardWidget(
            customText: 'Хорошее заведение',
            customTextcreatedAt: '1 августа 2023',
            customerName: 'Сатоши Накамото',
            feedbacks: '6 отзывов',
            commentOnTap: () {},
            likeOnTap: () {},
          ),
        ],
      ),
    );
  }
}
