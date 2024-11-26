import 'package:flutter/material.dart';

class AppUtils {
  static showOnetimeSnackbar(
      {required BuildContext context,
      required String message,
      Color bg = Colors.black}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
