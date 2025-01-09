// data/repositories/task_repository.d

import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/data/services/task_service.dart';

class TaskRepository {
  TaskRepository({
    required TaskService taskService,
  }) : _taskService = taskService;

  final TaskService _taskService;

  Future<List<Task>> getAllTasks() async {
    return await _taskService.getAllTasks();
  }

  Future<int> insertTask(Task task) async {
    return await _taskService.insertTask(task);
  }

  Future<int> deleteTask(int id) async {
    return await _taskService.deleteTask(id);
  }

  Future<bool> updateTask(Task task) async {
    return await _taskService.updateTask(task);
  }
}
