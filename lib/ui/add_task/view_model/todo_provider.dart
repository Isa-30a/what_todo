import 'package:flutter/material.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/data/repositories/task_repository.dart';
import 'package:what_todo/data/services/task_service.dart';
import 'package:what_todo/ui/add_task/view_model/new_todo_vm.dart';

class TodoProvider extends ChangeNotifier {
  Future<List<Task>>? _futureData;

  Future<List<Task>> get futureData => _futureData!;

  final vm = NewTodoVm(
    taskRepository: TaskRepository(taskService: TaskService()),
  );
  TodoProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    _futureData = vm.getAllTasks();
    notifyListeners();
  }

  Future<void> insertTask(Task task) async {
    await vm.insertTask(task);
    notifyListeners();
    refresh();
  }

  Future<void> deleteTask(int id) async {
    await vm.deleteTask(id);
    notifyListeners();
    refresh();
  }

  Future<void> updateTask(Task task) async {
    await vm.updateTask(task);
    notifyListeners();
    refresh();
  }

  Future<void> clearCompleted() async {
    final tasks = await vm.getAllTasks();
    await vm.clearCompleted(tasks);
    notifyListeners();
    refresh();
  }

  Future<void> refresh() async {
    await _loadData();
  }
}
