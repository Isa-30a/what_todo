import 'package:flutter/material.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/data/repositories/task_repository.dart';
import 'package:what_todo/data/services/task_service.dart';
import 'package:what_todo/ui/add_task/view_model/new_todo_vm.dart';

class TodoProvider extends ChangeNotifier {
  Future<List<Task>>? _futureData;

  Future<List<Task>> get futureData => _futureData!;
  int _selectedIndex = 0;

  final vm = NewTodoVm(
    taskRepository: TaskRepository(taskService: TaskService()),
  );
  TodoProvider() {
    loadData(_selectedIndex);
  }

  Future<void> loadData(index) async {
    switch (index) {
      case 0: //para todas las tareas
        _selectedIndex = 0;
        _futureData = vm.getAllTasks();
        break;
      case 1: // Para solo las tareas activas (que no han sido completadas)
        _selectedIndex = 1;
        _futureData = vm.getActiveTasks();
        break;
      case 2: // Para las tareas completadas
        _selectedIndex = 2;
        _futureData = vm.getCompletedTasks();
        break;
    }
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
    await loadData(_selectedIndex);
  }
}
