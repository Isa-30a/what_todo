import 'package:flutter/material.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/ui/add_task/widgets/task_list_tile.dart';

/// Displays a list of SampleItems.
class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
    this.tasks = const [
      Task(title: 'NewTask', id: 0),
      Task(id: 1, title: 'Taask')
    ],
  });

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Card(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),

          // Providing a restorationId allows the ListView to restore the
          // scroll position when a user leaves and returns to the app after it
          // has been killed while running in the background.
          restorationId: 'tasksListView',
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            final item = tasks[index];

            return TaskListTile(task: item);
          },
        ),
      ),
    );
  }
}
