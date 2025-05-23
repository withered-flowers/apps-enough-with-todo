import 'package:enough_with_todo/utils/utils.dart';
import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  // TODO: Part 4 - 15:02

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(text: "Add New Task"),
        backgroundColor: context.colorScheme.primary,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CommonTextField(title: "Task Title", hintText: "Task Title"),
            Gap(16),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(title: "Date", hintText: "May, 21"),
                ),
                Gap(16),
                Expanded(
                  child: CommonTextField(title: "Time", hintText: "10:30"),
                ),
              ],
            ),
            Gap(16),
            CommonTextField(title: "Note", hintText: "Task Note"),
          ],
        ),
      ),
    );
  }
}
