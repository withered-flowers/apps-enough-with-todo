import 'package:enough_with_todo/data/data.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDatasource _dataSource;

  TaskRepositoryImpl(this._dataSource);

  @override
  Future<void> addTask(Task task) async {
    try {
      await _dataSource.addTask(task);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await _dataSource.deleteTask(task);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _dataSource.updateTask(task);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return await _dataSource.getAllTasks();
    } catch (e) {
      rethrow;
    }
  }
}
