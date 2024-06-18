import 'package:flutter/material.dart';

class AdvertWarningText extends StatelessWidget {
  const AdvertWarningText({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
      ),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 12,
          color: Colors.red[900],
        ),
      ),
    );
  }
}
