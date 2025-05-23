import 'package:enough_with_todo/data/data.dart';
import 'package:flutter/material.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../config/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;

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
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(text: 'May 21, 2025', fontSize: 20),
                      DisplayWhiteText(
                        text: 'My Todo list',
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     width: deviceSize.width,
              //     color: colors.secondary,
              //   ),
              // ),
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
                    DisplayListsOfTasks(
                      tasks: const [
                        Task(
                          title: 'title 1',
                          note: 'note',
                          time: '10:12',
                          date: 'Aug, 07',
                          isCompleted: false,
                          category: TaskCategories.shopping,
                        ),
                        Task(
                          title: 'title 2 title 2 title 2',
                          note: '',
                          time: '13:12',
                          date: 'Aug, 07',
                          isCompleted: false,
                          category: TaskCategories.education,
                        ),
                      ],
                    ),
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
                      tasks: const [
                        Task(
                          title: 'title 1',
                          note: '',
                          time: '10:22',
                          date: 'Aug, 07',
                          isCompleted: true,
                          category: TaskCategories.personal,
                        ),
                        Task(
                          title: 'title 2 title 2 title 2',
                          note: 'note',
                          time: '13:22',
                          date: 'Aug, 07',
                          isCompleted: true,
                          category: TaskCategories.work,
                        ),
                      ],
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
}
