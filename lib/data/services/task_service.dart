import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/db/database_helper.dart';

class TaskService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  Future<List<Task>> getAllTasks() async {
    final response = await _dbHelper.getAllTasks();
    final tasks = response.map((m) => Task.fromJson(m)).toList();
    return tasks;
  }

  Future<int> insertTask(Task task) async {
    final response = await _dbHelper.insertTask(task.toJson());
    return response;
  }

  Future<int> deleteTask(int id) async {
    final response = await _dbHelper.deleteTask(id);
    return response;
  }

  Future<bool> updateTask(Task task) async {
    final response = await _dbHelper.updateTask(task.toJson());
    if (response == 1) {
      return true;
    }
    return false;
  }

  Future<void> clearCompleted(List<Task> tasks) async {
    for (var task in tasks) {
      if (task.completed) {
        await _dbHelper.deleteTask(task.id!);
      }
    }
  }

  Future<List<Task>> getActiveTasks() async {
    return await _dbHelper.getActiveTasks();
  }

  Future<List<Task>> getCompletedTasks() async {
    return await _dbHelper.getCompletedTasks();
  }
}
