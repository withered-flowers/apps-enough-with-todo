import 'package:enough_with_todo/config/routes/routes.dart';
import 'package:enough_with_todo/data/data.dart';
import 'package:enough_with_todo/providers/providers.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = completedTask(taskState.tasks, ref);
    final uncompletedTasks = uncompletedTask(taskState.tasks, ref);
    final selectedDate = ref.watch(dateProvider);

    return Scaffold(
      appBar: AppBar(
        // title: DisplayWhiteText(text: "Home Screen"),
        backgroundColor: context.colorScheme.primary,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.2,
                width: deviceSize.width,
                color: colors.primary,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Helpers.selectDate(context, ref),
                        child: DisplayWhiteText(
                          text: DateFormat.yMMMd().format(selectedDate),
                          fontSize: 20,
                        ),
                      ),
                      const DisplayWhiteText(
                        text: 'My Todo list',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DisplayListsOfTasks(tasks: uncompletedTasks),
                    Gap(16),
                    // const DisplayWhiteText(text: 'Completed: 0', fontSize: 16),
                    Text(
                      "Completed",
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontSize: 24,
                      ),
                    ),
                    Gap(8),
                    DisplayListsOfTasks(
                      tasks: completedTasks,
                      isCompletedTasks: true,
                    ),
                    Gap(8),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text("Add New Task"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> completedTask(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (final task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);

      if (task.isCompleted && isTaskDay) {
        filteredTask.add(task);
      }
    }

    return filteredTask;
  }

  List<Task> uncompletedTask(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (final task in tasks) {
      final isTaskDay = Helpers.isTaskFromSelectedDate(task, selectedDate);
      if (!task.isCompleted && isTaskDay) {
        filteredTask.add(task);
      }
    }

    return filteredTask;
  }
}
