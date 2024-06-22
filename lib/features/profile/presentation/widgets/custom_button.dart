import 'package:flutter/material.dart';
import 'package:w_sharme_beauty/core/theme/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(70, 30)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(AppColors.purple),
      ),
      onPressed: () {},
      child: const Text("Подписаться", style: TextStyle(color: Colors.white)),
    );
  }
}
