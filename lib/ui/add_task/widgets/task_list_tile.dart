import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      leading: CircleAvatar(
        radius: 20,
        // backgroundImage: AssetImage(Assets.bgMobileDark),
        child: IconButton(
          onPressed: () {},
          icon: (task.completed)
              ? Icon(Icons.check)
              : Icon(Icons.circle_outlined),
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          if (task.id != null) {
            Provider.of<TodoProvider>(context, listen: false)
                .deleteTask(task.id!);
          }
        },
        icon: Icon(Icons.close),
      ),
    );
  }
}
