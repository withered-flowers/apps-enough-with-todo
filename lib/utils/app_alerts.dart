import 'package:enough_with_todo/data/data.dart';
import 'package:enough_with_todo/providers/providers.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

  static displayDeleteAlertDialog(
    BuildContext context,
    WidgetRef ref,
    Task task,
  ) async {
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(),
      child: Text('Cancel', style: context.textTheme.labelLarge),
    );

    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(taskProvider.notifier).deleteTask(task).then((data) {
          if (!context.mounted) return;
          context.pop();
          AppAlerts.displaySnackBar(context, 'Task deleted successfully');
        });
      },
      child: Text(
        'Delete',
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.error,
        ),
      ),
    );

    AlertDialog alert = AlertDialog(
      title: Text("Delete selected task?"),
      actions: [cancelButton, deleteButton],
    );

    await showDialog(
      context: context,
      builder: (ctx) {
        return alert;
      },
    );
  }
}
