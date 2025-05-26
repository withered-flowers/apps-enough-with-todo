import 'package:enough_with_todo/data/data.dart';
import 'package:enough_with_todo/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Helpers {
  Helpers._();

  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );

      return DateFormat.jm().format(date);
    } catch (err) {
      return '12:00 pm';
    }
  }

  static void selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 100),
    );

    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }

  static bool isTaskFromSelectedDate(Task task, DateTime selectedDate) {
    final DateTime taskDate = _stringToDateTime(task.date);

    final DateTime selectedDateWithoutTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );

    final DateTime taskDateWithoutTime = DateTime(
      taskDate.year,
      taskDate.month,
      taskDate.day,
    );

    if (taskDateWithoutTime.isAtSameMomentAs(selectedDateWithoutTime)) {
      return true;
    }

    return false;
  }

  static DateTime _stringToDateTime(String dateString) {
    try {
      return DateFormat.yMMMd().parse(dateString);
    } catch (e) {
      return DateTime.now();
    }
  }
}
