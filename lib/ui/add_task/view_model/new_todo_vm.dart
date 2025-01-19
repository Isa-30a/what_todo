import 'package:what_todo/data/repositories/task_repository.dart';

class NewTodoVm {
  const NewTodoVm({
   required TaskRepository taskRepository,
   }): _taskRepository = taskRepository;

    final TaskRepository _taskRepository;
}