import 'package:flutter/material.dart';

class BottomSheetUtil {
  static void showAppBottomSheet(
    BuildContext context,
    Widget child, {
    bool closeCurrent = false,
  }) {
    if (closeCurrent) {
      Navigator.pop(context);
    }

    if (!closeCurrent || context.mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) => child,
      );
    }
  }
}
