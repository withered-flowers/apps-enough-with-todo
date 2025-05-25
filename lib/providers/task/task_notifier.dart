import 'package:enough_with_todo/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enough_with_todo/providers/providers.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;

  TaskNotifier(this._repository) : super(TaskState.initial());

  // ? PART 06 - 06:45

  Future<void> createTask(Task task) async {
    try {
      await _repository.addTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      await _repository.addTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _repository.addTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
