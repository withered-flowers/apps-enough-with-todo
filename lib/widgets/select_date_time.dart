import 'package:enough_with_todo/providers/providers.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);

    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            title: "Date",
            hintText: DateFormat.yMMMd().format(date),
            suffixIcon: IconButton(
              onPressed: () => Helpers.selectDate(context, ref),
              icon: FaIcon(FontAwesomeIcons.calendar),
            ),
            readOnly: true,
          ),
        ),
        Gap(16),
        Expanded(
          child: CommonTextField(
            title: "Time",
            hintText: Helpers.timeToString(time),
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context, ref),
              icon: FaIcon(FontAwesomeIcons.clock),
            ),
            readOnly: true,
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }
}
