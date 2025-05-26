import 'package:enough_with_todo/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);

  return TaskRepositoryImpl(datasource);
});
