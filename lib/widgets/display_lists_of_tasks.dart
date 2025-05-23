import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:enough_with_todo/data/data.dart';
import 'package:enough_with_todo/utils/utils.dart';

class DisplayListsOfTasks extends StatelessWidget {
  final List<Task> tasks;
  final bool isCompletedTasks;

  const DisplayListsOfTasks({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.24 : deviceSize.height * 0.24;
    final emptyTasksMessage =
        isCompletedTasks
            ? 'There\'s no completed tasks'
            : 'There\'s no tasks in todo';

    return CommonContainer(
      height: height,
      child:
          tasks.isEmpty
              ? Center(child: Text(emptyTasksMessage))
              : ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (ctx, index) {
                  final task = tasks[index];

                  return InkWell(
                    onLongPress: () {
                      // TODO: Delete Task
                    },
                    onTap: () async {
                      // TODO: Show Task Details

                      await showModalBottomSheet(
                        useSafeArea: true,
                        context: context,
                        builder: (ctx) {
                          return TaskDetails(task: task);
                        },
                      );
                    },
                    child: TaskTile(task: task),
                  );
                },
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(thickness: 1.5);
                },
              ),
    );
  }
}
