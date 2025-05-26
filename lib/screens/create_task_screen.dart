import 'package:enough_with_todo/config/routes/routes.dart';
import 'package:enough_with_todo/data/data.dart';
import 'package:enough_with_todo/providers/providers.dart';
import 'package:enough_with_todo/utils/utils.dart';
import 'package:enough_with_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();

    super.dispose();
  }

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
              CommonTextField(
                title: "Task Title",
                hintText: "Task Title",
                controller: _titleController,
              ),
              Gap(16),
              SelectCategory(),
              Gap(16),
              SelectDateTime(),
              Gap(16),
              CommonTextField(
                title: "Note",
                hintText: "Task Note",
                maxLines: 6,
                controller: _noteController,
              ),
              Gap(32),
              ElevatedButton(onPressed: _addTask, child: Text("Add Task")),
            ],
          ),
        ),
      ),
    );
  }

  void _addTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    bool isEmptyTitle = title.isEmpty;
    bool isEmptyNote = note.isEmpty;

    try {
      if (isEmptyTitle && isEmptyNote) {
        throw Exception("Title and Note cannot be empty");
      } else if (isEmptyTitle) {
        throw Exception("Title cannot be empty");
      } else if (isEmptyNote) {
        throw Exception("Note cannot be empty");
      }

      final task = Task(
        title: title,
        note: note,
        date: DateFormat.yMMMd().format(date),
        time: Helpers.timeToString(time),
        category: category,
        isCompleted: false,
      );

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        if (!mounted) return;
        AppAlerts.displaySnackBar(context, "Task created successfully");
        context.go(RouteLocation.home);
      });
    } catch (e) {
      if (!mounted) return;
      AppAlerts.displaySnackBar(context, e.toString());
    }
  }
}
