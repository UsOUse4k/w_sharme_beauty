import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_styles.dart';
import 'package:w_sharme_beauty/core/widgets/custom_container.dart';
import 'package:w_sharme_beauty/core/widgets/widgets.dart';
import 'package:w_sharme_beauty/features/chat/presentation/widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlScaffold(
      appBar: GlAppBar(
        leading: Text('Чат', style: AppStyles.w500f22,),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
              child: Column(
                children: [
                  SearchWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

