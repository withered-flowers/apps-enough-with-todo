import 'package:enough_with_todo/utils/utils.dart';
import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  // TODO: Part 5 - 00:00

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(text: "Add New Task"),
        backgroundColor: context.colorScheme.primary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(title: "Task Title", hintText: "Task Title"),
              Gap(16),
              SelectCategory(),
              Gap(16),
              SelectDateTime(),
              Gap(16),
              CommonTextField(
                title: "Note",
                hintText: "Task Note",
                maxLines: 6,
              ),
              Gap(32),
              ElevatedButton(onPressed: () {}, child: Text("Add Task")),
            ],
          ),
        ),
      ),
    );
  }
}
