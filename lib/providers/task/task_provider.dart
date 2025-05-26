import 'package:enough_with_todo/data/data.dart';
import 'package:enough_with_todo/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);

  return TaskNotifier(repository);
});
