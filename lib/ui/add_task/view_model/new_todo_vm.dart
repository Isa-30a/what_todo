import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/data/repositories/task_repository.dart';

class NewTodoVm {
  const NewTodoVm({
    required TaskRepository taskRepository,
  }) : _taskRepository = taskRepository;

  final TaskRepository _taskRepository;
  Future<List<Task>> getAllTasks() async {
    return await _taskRepository.getAllTasks();
  }

  Future<int> insertTask(Task task) async {
    return await _taskRepository.insertTask(task);
  }

  Future<int> deleteTask(int id) async {
    return await _taskRepository.deleteTask(id);
  }

  Future<bool> updateTask(Task task) async {
    return await _taskRepository.updateTask(task);
  }

  Future<void> clearCompleted(List<Task> tasks) async {
    await _taskRepository.clearCompleted(tasks);
  }

  Future<List<Task>> getActiveTasks() async {
    return await  _taskRepository.getActiveTasks();
  }

  Future<List<Task>> getCompletedTasks() async {
    return await  _taskRepository.getCompletedTasks();
  }
}
