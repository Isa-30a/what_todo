import 'package:flutter/material.dart';
import 'package:what_todo/data/repositories/task_repository.dart';
import 'package:what_todo/data/services/task_service.dart';
import 'package:what_todo/ui/add_task/view_model/new_todo_vm.dart';
import 'package:what_todo/ui/add_task/widgets/task_list_tile.dart';

/// Displays a list of SampleItems.
class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = NewTodoVm(
      taskRepository: TaskRepository(taskService: TaskService()),
    );
    final tasks = vm.getAllTasks();
    return Scaffold(
      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Card(
        child: FutureBuilder(
          future: tasks,
          builder: (context, snapshot) {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),

              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'tasksListView',
              itemCount: snapshot.hasData ? snapshot.data!.length : 0,
              itemBuilder: (BuildContext context, int index) {
                final item = snapshot.data![index];

                return TaskListTile(task: item);
              },
            );
          },
        ),
      ),
    );
  }
}
