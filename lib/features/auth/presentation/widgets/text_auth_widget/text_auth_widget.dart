import 'package:flutter/material.dart';

class TextAuthWidget extends StatelessWidget {
  const TextAuthWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF0A0A0A),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}