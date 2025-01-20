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

  // Future<String> fetchData() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   return "Datos cargados: ${DateTime.now()}";
  // }

  void refresh() {
    _loadData();
  }
}
