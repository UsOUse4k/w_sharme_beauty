import 'package:flutter/material.dart';

class TitleAuthWidget extends StatelessWidget {
  const TitleAuthWidget({
    super.key, required this.title,
  });

  final String title;  

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w500,
        color: Color(0xFF0A0A0A),
      ),
    );
  }
}