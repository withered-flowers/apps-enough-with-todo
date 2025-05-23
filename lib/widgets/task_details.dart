import 'package:enough_with_todo/data/data.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TaskDetails extends StatelessWidget {
  final Task task;

  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return SizedBox(
      width: context.deviceSize.width,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            CircleContainer(
              color: task.category.color,
              borderColor: task.category.color,
              child: Icon(task.category.icon, color: task.category.color),
            ),
            Gap(8),
            Text(
              task.title,
              style: style.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(task.time, style: style.titleMedium),
            Gap(8),
            Visibility(
              visible: !task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('task to be completed on ${task.date}'),
                  Icon(Icons.check_box, color: task.category.color),
                ],
              ),
            ),
            Gap(8),
            Divider(thickness: 1.5, color: task.category.color),
            Gap(8),
            Text(
              task.note.isEmpty
                  ? 'There is no additional note for this task'
                  : task.note,
            ),
            Gap(8),
            Visibility(
              visible: task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Task completed'),
                  Icon(Icons.check_box, color: task.category.color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
