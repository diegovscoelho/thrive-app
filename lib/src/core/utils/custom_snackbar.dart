import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(
    BuildContext context,
    String message, {
    Color? backgroundColor,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        action: action,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          right: 20,
          left: 20,
        ),
      ),
    );
  }

  static void success(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.green);
  }

  static void error(BuildContext context, String message) {
    show(
      context,
      message,
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {},
      ),
    );
  }

  static void info(BuildContext context, String message) {
    show(context, message, backgroundColor: Colors.blue);
  }
}
