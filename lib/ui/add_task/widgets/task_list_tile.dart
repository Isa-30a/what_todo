import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:what_todo/config/assets.dart';
import 'package:what_todo/data/model/task.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:what_todo/ui/add_task/view_model/todo_provider.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return ListTile(
      title: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.left,
        maxLines: 1,
        controller: controller..text = task.title,
        onEditingComplete: () {
          final taskTitle = controller.text;
          Provider.of<TodoProvider>(context, listen: false).updateTask(
            Task(title: taskTitle),
          );
          controller.clear();
        },
      ),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(Assets.bgMobileDark),
        child: Consumer<TodoProvider>(
          builder: (context, value, child) {
            return TextButton(
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false).updateTask(
                  task.copyWith(completed: !task.completed),
                );
              },
              child: (task.completed)
                  ? SvgPicture.asset(Assets.iconcheck)
                  : Icon(Icons.circle_outlined),
            );
          },
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
