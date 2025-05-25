import 'package:equatable/equatable.dart';

import 'package:enough_with_todo/data/data.dart';

class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState(this.tasks);

  const TaskState.initial({this.tasks = const []});

  @override
  List<Object?> get props => [tasks];

  TaskState copyWith({List<Task>? tasks}) {
    return TaskState(tasks ?? this.tasks);
  }
}
