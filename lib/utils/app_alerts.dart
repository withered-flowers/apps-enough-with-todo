import 'package:enough_with_todo/utils/utils.dart';
import 'package:flutter/material.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: context.textTheme.bodyLarge),
        backgroundColor: context.colorScheme.inversePrimary,
      ),
    );
  }
}
